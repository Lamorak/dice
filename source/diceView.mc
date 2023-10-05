import Toybox.Graphics;
import Toybox.WatchUi;

class diceView extends WatchUi.View {

    var rollProvider;

    function initialize() {
        View.initialize();
        rollProvider = getApp().diceRollProvider;
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        var rollLabel = View.findDrawableById("roll") as Text;
        rollLabel.setText(rollProvider.diceRoll.toString());
        View.onUpdate(dc);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
