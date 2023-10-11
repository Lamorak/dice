import Toybox.Graphics;
import Toybox.WatchUi;

class diceView extends WatchUi.View {

    var rollProvider;

    function initialize() {
        View.initialize();
        rollProvider = getApp().diceRollProvider;
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function onShow() as Void {
    }

    function onUpdate(dc as Dc) as Void {
        var rollLabel = View.findDrawableById("roll") as Text;
        rollLabel.setText(rollProvider.diceRoll.toString());
        View.onUpdate(dc);
    }

    function onHide() as Void {
    }
}
