package { // The empty package.
    // logging/MyCustomLogger2.as
    import mx.controls.Button;
    import flash.events.*;
    import flash.events.MouseEvent;
    import mx.logging.*;
    import mx.logging.targets.*;
        
    public class MyCustomLogger2 extends Button {

        private var myLogger:ILogger;

        public function MyCustomLogger2() {
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
                dynamicLogger(LogEventLevel.INFO, e, "STARTUP");
            }
        }

        private function logUIEvent(e:MouseEvent):void {
            if (Log.isDebug()) {
                dynamicLogger(LogEventLevel.DEBUG, e, "EVENT");
            }
        }
        
        private function dynamicLogger(
                level:int, 
                e:Event, prefix:String):void {
            var s:String = "__" + prefix + "__" + e.currentTarget + 
                ":" + e.type;
            myLogger.log(level, s);
        }

    }
}