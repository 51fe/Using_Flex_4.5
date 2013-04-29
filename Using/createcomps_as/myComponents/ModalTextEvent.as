package myComponents
{
    // createcomps_as/myComponents/ModalTextEvent.as    
    import spark.components.TextArea;
    import flash.events.Event;

    [Event(name="enableChanged", type="flash.events.Event")]
    public class ModalTextEvent extends TextArea {

        public function ModalTextEvent() {
            super();
        
            // Register event listener. 
            addEventListener("enableChanged", enableChangedListener);
        }

        public function enableInput(value:Boolean):void {
            // Method body.
    
            // Dispatch event.
            dispatchEvent(new Event("enableChanged"));
        }

        private function enableChangedListener(eventObj:Event):void {
            // Handle event.
        }
    }
}