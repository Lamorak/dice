import Toybox.Application.Properties;
import Toybox.Math;
import Toybox.Lang;

class diceRollProvider {

    var n;
    var d;
    var diceRoll;

    public function initialize() {
        diceRoll = rollDice();
    }

    function rollDice() as Array<Number> {
        n = Properties.getValue(KEY_DICE_COUNT);
        d = Properties.getValue(KEY_NUMBER_SIDES);
        
        var roll = new Array<Number>[n];
        for( var i = 0; i < roll.size(); i++ ) {
            roll[i] = 1 + Math.rand() % d;
        }
        diceRoll = roll;
        return roll;
    }
}