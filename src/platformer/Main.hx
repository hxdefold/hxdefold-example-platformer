package platformer;

import defold.Msg;
import defold.Message;
import defold.Vmath;

class Main extends defold.support.Script<{}> {
    override function init(_) {
        // set blue background
        Msg.post("@render:", DefoldMessages.ClearColor, {color: Vmath.vector4(96 / 255, 148 / 255, 185 / 255, 0)});
    }
}
