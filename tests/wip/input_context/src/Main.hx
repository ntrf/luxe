package;
import luxe.Input;
import InputMap.InteractType;
import InputMap.InputEvent;
import InputMap.ScreenAxis;
import InputMap.RangeEdgeType;
import InputMap.RangeChangeType;

class Main extends luxe.Game {
    override function ready() {
        var map = new InputMap();

        map.bind_key('jump', Key.key_x);
        
        map.bind_mouse_button('jump', MouseButton.left);
        map.bind_mouse_range('left_move', ScreenAxis.X, 0, 0.5, RangeChangeType.change, RangeEdgeType.down, RangeEdgeType.up);
        map.bind_mouse_range('middle_move', ScreenAxis.Y, 0.25, 0.75, RangeChangeType.none, RangeEdgeType.up, RangeEdgeType.down);
        map.bind_mouse_wheel('wheel_change');
        
        map.bind_gamepad_button('jump', 0, null);
        map.bind_gamepad_range('run', 0, 0.8, 1.0, RangeChangeType.change, RangeEdgeType.down, RangeEdgeType.up);
        map.bind_gamepad_range('run', 0, -1.0, -0.8, RangeChangeType.change, RangeEdgeType.down, RangeEdgeType.up);
        map.bind_gamepad_range('hold_trigger', 5, 0.25, 0.75, RangeChangeType.none, RangeEdgeType.down, RangeEdgeType.up);

        map.bind_touch('touch');
        map.bind_touch_range('touch_move', ScreenAxis.X, 0.25, 0.75, RangeChangeType.change, RangeEdgeType.down, RangeEdgeType.up);

        map.on(InteractType.down, input_down);
        map.on(InteractType.up, input_up);
        map.on(InteractType.change, analog_changed);
    }

    function input_down(_event:InputEvent) {
        trace('down');
        trace(_event.name);
    }

    function input_up(_event:InputEvent) {
        trace('up');
        trace(_event.name);
    }

    var count:Int = 0;
    function analog_changed(_event:InputEvent) {
        if(count % 40 == 0) {
            trace('change');
            trace(_event.name);
        }
        count++;
    }

    override function onkeyup(e:KeyEvent) {
        if(e.keycode == Key.escape)
            Luxe.shutdown();
    }
}