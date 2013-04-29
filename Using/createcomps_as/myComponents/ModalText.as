package myComponents
{
    // createcomps_as/myComponents/ModalText.as    
    import mx.controls.TextArea;
    import flash.events.Event;

    public class ModalText extends TextArea {

        public function ModalText() {
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