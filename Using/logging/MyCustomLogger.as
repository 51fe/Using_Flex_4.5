// logging/MyCustomLogger.as
package { // The empty package.
    import mx.controls.Button;
    import flash.events.*;
    import mx.logging.*;
    import mx.logging.targets.*;
        
    public class MyCustomLogger extends Button {

        private var myLogger:ILogger;

        public function MyCustomLogger() {
            super();
            initListeners();
            initLogger();
        }
        private function initListeners():void {
            // Add event listeners life cycle events.
            addEventListener("preinitialize", logLifeCycleEvent);
            addEventListener("initialize", logLifeCycleEvent);
            addEventListener("creationComplete", logLifeCycleEvent);
            addEventListener("updateComplete", logLifeCycleEvent);
            
            // Add event listeners for other common events.
            addEventListener("click", logUIEvent);      
            addEventListener("mouseUp", logUIEvent);        
            addEventListener("mouseDown", logUIEvent);      
            addEventListener("mouseOver", logUIEvent);      
            addEventListener("mouseOut", logUIEvent);       
        }
        private function initLogger():void {
            myLogger = Log.getLogger("MyCustomClass");
        }

        private function logLifeCycleEvent(e:Event):void {
            if (Log.isInfo()) {
                myLogger.info(" STARTUP: " + e.target + ":" + e.type);
            }
        }

        private function logUIEvent(e:MouseEvent):void {
            if (Log.isDebug()) {
                myLogger.debug(" EVENT:   " + e.target + ":" + e.type);
            }
        }
    }
}