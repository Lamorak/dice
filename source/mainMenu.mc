import Toybox.Application.Properties;
import Toybox.Lang;
import Toybox.WatchUi;

class MainMenu extends Menu2 {

    var diceCountItem;
    var sidesNumberItem;

    public function initialize() {
        diceCountItem = new MenuItem(Rez.Strings.menu_dice_count, null, :item_n, {});
        sidesNumberItem = new MenuItem(Rez.Strings.menu_number_sides, null, :item_d, {});
        addItem(diceCountItem);
        addItem(sidesNumberItem);
        Menu2.initialize({});
    }

    function onShow() {
        diceCountItem.setSubLabel(Properties.getValue(KEY_DICE_COUNT).toString());
        sidesNumberItem.setSubLabel(Properties.getValue(KEY_NUMBER_SIDES).toString());
        updateItem(diceCountItem, findItemById(diceCountItem.getId()));
        updateItem(sidesNumberItem, findItemById(sidesNumberItem.getId()));
        Menu2.onShow();
    }    
}

class mainMenuDelegate extends WatchUi.Menu2InputDelegate {

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