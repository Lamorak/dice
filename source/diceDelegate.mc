import Toybox.Lang;
import Toybox.WatchUi;

class diceDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onMenu() as Boolean {
        WatchUi.pushView(new MainMenu(), new mainMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    function onSelect() as Boolean {
        var rollProvider = getApp().diceRollProvider;
        var roll = rollProvider.rollDice();
        System.println(roll);
        WatchUi.requestUpdate();
        return true;
    }

}