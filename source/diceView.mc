import Toybox.Graphics;
import Toybox.Math;
import Toybox.WatchUi;

class diceView extends WatchUi.View {

    var rollProvider;

    function initialize() {
        View.initialize();
        rollProvider = getApp().diceRollProvider;
    }

    function onUpdate(dc as Dc) as Void {
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.clear();

        var roll = rollProvider.diceRoll;
        var cx = dc.getWidth() / 2;
        var cy = dc.getHeight() / 2;
        var r = roll.size() > 1 ? dc.getWidth() / 4 : 0;
        var theta_offset = roll.size() % 2 == 1 ? -Math.PI / 2 : 0;

        for( var i = 0; i < roll.size(); i++ ) {
            var theta = 2 * Math.PI / roll.size() * i + theta_offset;
            var x = cx + r * Math.cos(theta);
            var y = cy + r * Math.sin(theta);

            dc.drawText(
                x,
                y,
                Graphics.FONT_NUMBER_MILD,
                roll[i],
                Graphics.TEXT_JUSTIFY_VCENTER | Graphics.TEXT_JUSTIFY_CENTER     
            );
        }
    }
}
