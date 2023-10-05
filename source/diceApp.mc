import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class diceApp extends Application.AppBase {

    var diceRollProvider;

    function initialize() {
        AppBase.initialize();
        diceRollProvider = new diceRollProvider();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new diceView(), new diceDelegate() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as diceApp {
    return Application.getApp() as diceApp;
}