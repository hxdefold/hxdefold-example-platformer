package platformer;

import defold.Msg;
import defold.Render;
import defold.Vmath;

class Main extends defold.support.Script<{}> {
    override function init(_) {
        // set blue background
        Msg.post("@render:", RenderMessages.clear_color, {color: Vmath.vector4(96 / 255, 148 / 255, 185 / 255, 0)});
    }
}
