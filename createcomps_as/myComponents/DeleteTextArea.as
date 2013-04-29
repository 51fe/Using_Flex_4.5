package myComponents
{
    // createcomps_as/myComponents/DeleteTextArea.as
    import spark.components.TextArea;
    import flash.events.KeyboardEvent;
        
    public class DeleteTextArea extends TextArea {
        
        // Constructor
        public function DeleteTextArea() {
            // Call super().
            super();

            // Add event listener for keyDown event.
            addEventListener("keyDown", myKeyDown);     
        }       

        // Define private keyDown event handler.
        private function myKeyDown(eventObj:KeyboardEvent):void {   
            // Check to see if Ctrl+Alt+Z pressed. Keycode is 90.         
            if (eventObj.ctrlKey && eventObj.keyCode == 90) 
                text = ""; 
        }
    }
}