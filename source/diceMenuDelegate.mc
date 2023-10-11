import Toybox.Application.Properties;
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
                showNumberPicker(item.getLabel(), MAX_DICE_COUNT, KEY_DICE_COUNT);
                break;
            case :item_d:
                showNumberPicker(item.getLabel(), MAX_DICE_SIDES, KEY_NUMBER_SIDES);
                break;
        }
    }

    function showNumberPicker(label, count, key) {
        var value = Properties.getValue(key);
        WatchUi.pushView(
            new NumberPicker(label, value, count), 
            new NumberPickerDelegate(new ValueSaver(key)), 
            WatchUi.SLIDE_LEFT
        );
    }
}