import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

class diceMenuDelegate extends WatchUi.Menu2InputDelegate {

    function initialize() {
        Menu2InputDelegate.initialize();
    }

    function onSelect(item as MenuItem) {
        switch (item.getId()) {
            case :item_n:
                showNumberPicker(item.getLabel(), 6);
                break;
            case :item_d:
                showNumberPicker(item.getLabel(), 20);
                break;
        }
    }

    function showNumberPicker(label, count) {
        WatchUi.pushView(new NumberPicker(label, count), new NumberPickerDelegate(new ValueSaver()), WatchUi.SLIDE_RIGHT);
    }
}