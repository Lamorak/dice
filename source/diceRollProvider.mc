import Toybox.Math;
import Toybox.Lang;

class diceRollProvider {

    var diceRoll = "nothing";

    function rollDice(n, d) as Array<Number> {
        var roll = new Array<Number>[n];
        for( var i = 0; i < roll.size(); i++ ) {
            roll[i] = 1 + Math.rand() % d;
        }
        diceRoll = roll;
        return roll;
    }
}