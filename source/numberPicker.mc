import Toybox.Application.Properties;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.WatchUi;

class NumberPicker extends WatchUi.Picker {

    public function initialize(label, value, count) {
        var title = new WatchUi.Text({
            :text=>label, 
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_SMALL,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER,
            :locY=>WatchUi.LAYOUT_VALIGN_BOTTOM
            });
        var factory = new NumberFactory(count);
        Picker.initialize({
            :title=>title, 
            :pattern=>[factory],
            :defaults=>[value - 1],
            :confirm=>null,
        });
    }
}

class NumberFactory extends WatchUi.PickerFactory {

    var count;

    function initialize(count) {
        me.count = count;
        PickerFactory.initialize();
    }

    function getSize() {
        return count;
    }

    function getValue(item) {
        return item + 1;
    }

    function getDrawable(item, isSelected) {
        return new WatchUi.Text({
            :text=>getValue(item).toString(), 
            :color=>Graphics.COLOR_WHITE,
            :font=>Graphics.FONT_LARGE,
            :locX=>WatchUi.LAYOUT_HALIGN_CENTER, 
            :locY=>WatchUi.LAYOUT_VALIGN_CENTER,
        });
    }
}


class NumberPickerDelegate extends WatchUi.PickerDelegate {

    var saver;

    public function initialize(saver) {
        me.saver = saver;
        PickerDelegate.initialize();
    }

    public function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

    public function onAccept(values) {
        saver.save(values[0]);
        WatchUi.popView(WatchUi.SLIDE_RIGHT);
        return true;
    }

}

class ValueSaver {

    var key;

    public function initialize(key) {
        me.key = key;
    }

    function save(value) {
        Properties.setValue(key, value);
    }
}
