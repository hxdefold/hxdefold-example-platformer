package platformer;

import defold.Msg;
import defold.Message;
import defold.Vmath;
import defold.Vector3;
import defold.Hash;
import defold.Go;
import defold.Sprite;
import defold.Physics;
import Defold.hash;
import defold.support.Script;

typedef HeroData = {
    var velocity:Vector3;
    var correction:Vector3;
    var ground_contact:Bool;
    var move_input:Float;
    var direction:Int;
    var anim:Null<Hash>;
    var touch_jump_timer:Float;
}

class Hero extends Script<HeroData> {
    // these are the tweaks for the mechanics, feel free to change them for a different feeling
    // the acceleration to move right/left
    static var move_acceleration = 3500;
    // acceleration factor to use when air-borne
    static var air_acceleration_factor = 0.8;
    // max speed right/left
    static var max_speed = 400;
    // gravity pulling the player down in pixel units
    static var gravity = -1100;
    // take-off speed when jumping in pixel units
    static var jump_takeoff_speed = 700;
    // time within a double tap must occur to be considered a jump (only used for mouse/touch controls)
    static var touch_jump_timeout = 0.2;

    // pre-hashing ids improves performance
    static var anim_run = hash("run");
    static var anim_idle = hash("idle");
    static var anim_jump = hash("jump");
    static var anim_fall = hash("fall");
    static var group_geometry = hash("geometry");
    static var input_left(default,never) = hash("left");
    static var input_right(default,never) = hash("right");
    static var input_jump(default,never) = hash("jump");
    static var input_touch(default,never) = hash("touch");

    override function init(self:HeroData) {
        // this lets us handle input in this script
        Msg.post(".", GoMessages.AcquireInputFocus);

        // initial player velocity
        self.velocity = Vmath.vector3(0, 0, 0);
        // support variable to keep track of collisions and separation
        self.correction = Vmath.vector3();
        // if the player stands on ground or not
        self.ground_contact = false;
        // movement input in the range [-1,1]
        self.move_input = 0;
        // character direction, for anim selection (-1 or 1)
        self.direction = 1;
        // the currently playing animation
        self.anim = null;
        // timer that controls the jump-window when using mouse/touch
        self.touch_jump_timer = 0;
    }

    override function update(self:HeroData, dt:Float) {
        // determine the target speed based on input
        var target_speed = self.move_input * max_speed;
        // calculate the difference between our current speed and the target speed
        var speed_diff = target_speed - self.velocity.x;
        // the complete acceleration to integrate over this frame
        var acceleration = Vmath.vector3(0, gravity, 0);
        if (speed_diff != 0) {
            // set the acceleration to work in the direction of the difference
            if (speed_diff < 0)
                acceleration.x = -move_acceleration;
            else
                acceleration.x = move_acceleration;
            // decrease the acceleration when air-borne to give a slower feel
            if (!self.ground_contact)
                acceleration.x = air_acceleration_factor * acceleration.x;
        }
        // calculate the velocity change this frame (dv is short for delta-velocity)
        var dv = acceleration * dt;
        // check if dv exceeds the intended speed difference, clamp it in that case
        if (Math.abs(dv.x) > Math.abs(speed_diff))
            dv.x = speed_diff;

        // save the current velocity for later use
        // (self.velocity, which right now is the velocity used the previous frame)
        var v0 = self.velocity;
        // calculate the new velocity by adding the velocity change
        self.velocity = self.velocity + dv;
        // calculate the translation this frame by integrating the velocity
        var dp = (v0 + self.velocity) * dt * 0.5;
        // apply it to the player character
        Go.set_position(Go.get_position() + dp);

        // update the jump timer
        if (self.touch_jump_timer > 0)
            self.touch_jump_timer = self.touch_jump_timer - dt;

        update_animations(self);

        // reset volatile state
        self.correction = Vmath.vector3();
        self.move_input = 0;
        self.ground_contact = false;
    }

    function update_animations(self:HeroData) {
        // make sure the player character faces the right way
        Sprite.set_hflip("#sprite", self.direction < 0);
        // make sure the right animation is playing
        if (self.ground_contact) {
            if (self.velocity.x == 0)
                play_animation(self, anim_idle);
            else
                play_animation(self, anim_run);
        } else {
            if (self.velocity.y > 0)
                play_animation(self, anim_jump);
            else
                play_animation(self, anim_fall);
        }
    }

    function play_animation(self:HeroData, anim:Hash) {
        // only play animations which are not already playing
        if (self.anim != anim) {
            // tell the sprite to play the animation
            Msg.post("#sprite", SpriteMessages.PlayAnimation, {id: anim});
            // remember which animation is playing
            self.anim = anim;
        }
    }

    function handle_geometry_contact(self:HeroData, normal:Vector3, distance:Float) {
        // project the correction vector onto the contact normal
        // (the correction vector is the 0-vector for the first contact point)
        var proj = Vmath.dot(self.correction, normal);
        // calculate the compensation we need to make for this contact point
        var comp = (distance - proj) * normal;
        // add it to the correction vector
        self.correction = self.correction + comp;
        // apply the compensation to the player character
        Go.set_position(Go.get_position() + comp);
        // check if the normal points enough up to consider the player standing on the ground
        // (0.7 is roughly equal to 45 degrees deviation from pure vertical direction)
        if (normal.y > 0.7)
            self.ground_contact = true;
        // project the velocity onto the normal
        proj = Vmath.dot(self.velocity, normal);
        // if the projection is negative, it means that some of the velocity points towards the contact point
        if (proj < 0)
            // remove that component in that case
            self.velocity = self.velocity - proj * normal;
    }

    override function on_message<T>(self:HeroData, message_id:Message<T>, message:T, _) {
        // check if we received a contact point message
        switch (message_id) {
            case PhysicsMessages.ContactPointResponse if (message.group == group_geometry): // check that the object is something we consider geometry
                handle_geometry_contact(self, message.normal, message.distance);
        }
    }

    function jump(self:HeroData) {
        // only allow jump from ground
        // (extend this with a counter to do things like double-jumps)
        if (self.ground_contact) {
            // set take-off speed
            self.velocity.y = jump_takeoff_speed;
            // play animation
            play_animation(self, anim_jump);
        }
    }

    function abort_jump(self:HeroData) {
        // cut the jump short if we are still going up
        if (self.velocity.y > 0)
            // scale down the upwards speed
            self.velocity.y = self.velocity.y * 0.5;
    }

    override function on_input(self:HeroData, action_id:Hash, action:ScriptOnInputAction):Bool {
        switch (action_id) {
            case input_left:
                self.move_input = -action.value;
                self.direction = -1;
            case input_right:
                self.move_input = action.value;
                self.direction = 1;
            case input_jump if (action.pressed):
                jump(self);
            case input_jump if (action.released):
                abort_jump(self);
            case input_touch:
                // move towards the touch-point
                var diff = action.x - Go.get_position().x;
                // update direction
                if (diff > 0)
                    self.direction = 1;
                else
                    self.direction = -1;
                // only give input when far away (more than 10 pixels)
                if (Math.abs(diff) > 10) {
                    // slow down when less than 100 pixels away
                    self.move_input = diff / 100;
                    // clamp input to [-1,1]
                    self.move_input = Math.min(1, Math.max(-1, self.move_input));
                }
                if (action.released) {
                    // start timing the last release to see if we are about to jump
                    self.touch_jump_timer = touch_jump_timeout;
                } else if (action.pressed) {
                    // jump on double tap
                    if (self.touch_jump_timer > 0)
                        jump(self);
                }
        }
        return false;
    }
}
