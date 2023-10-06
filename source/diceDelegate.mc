import Toybox.Lang;
import Toybox.WatchUi;

class diceDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        var menu = new Rez.Menus.MainMenu();
        WatchUi.pushView(menu, new diceMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Boolean {
        var rollProvider = getApp().diceRollProvider;
        var roll = rollProvider.rollDice(1, 6);
        System.println(roll);
        WatchUi.requestUpdate();
        return true;
    }

}