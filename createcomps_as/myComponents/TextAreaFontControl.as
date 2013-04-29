package myComponents
{
    // createcomps_as/myComponents/TextAreaFontControl.as    
    import spark.components.TextArea;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    
    public class TextAreaFontControl extends TextArea 
    {
        // Constructor  
        public function TextAreaFontControl() {
            super();

            // Add event listeners.
            addEventListener("keyDown", myKeyDown);     
            addEventListener("creationComplete", myCreationComplete);       
        }       

        // Define private var for current font size.
        private var currentFontSize:Number;

        // Define a public property for the minimum font size.
        public var minFontSize:Number = 5;      
        // Define a public property for the maximum font size.
        public var maxFontSize:Number = 15;
        
        // Initialization event handler for getting default font size.
        private function myCreationComplete(eventObj:Event):void {           
            // Get current font size
             currentFontSize = getStyle('fontSize');
        }

        // keyDown event handler.
        private function myKeyDown(eventObj:KeyboardEvent):void {   
            // Was Ctrl key pressed?
            if (eventObj.ctrlKey) 
            {                       
                switch (eventObj.keyCode) {
                    // Was Ctrl+Alt+I pressed?  
                    case 73 :
                        if (currentFontSize < maxFontSize) {
                            currentFontSize = currentFontSize + 1;
                            setStyle('fontSize', currentFontSize);
                        } 
                        break;
                    // Was Ctrl+Alt+ pressed?  
                    case 77 :
                        if (currentFontSize > minFontSize) {
                            currentFontSize = currentFontSize - 1;
                            setStyle('fontSize', currentFontSize);
                        }
                        break;
                    default :
                        break;
                }           
            } 
        }
    }
}