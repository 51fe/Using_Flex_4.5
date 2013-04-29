package myComponents
{
    // createcomps_as/myComponents/TextAreaFontControlGetSet.as    
    import spark.components.TextArea;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    
    public class TextAreaFontControlGetSet extends TextArea 
    {
        public function TextAreaFontControlGetSet() 
        {
            super();
            addEventListener("keyDown", myKeyDown);     
            addEventListener("creationComplete", myCreationComplete);       
        }       

        private var currentFontSize:Number;
        public var minFontSize:Number = 5;      

        // Define private variable for maxFontSize.
        private var _maxFontSize:Number = 15;
            
        // Define public getter method.
        public function get maxFontSize():Number {
            return _maxFontSize;
        }
                
        // Define public setter method.
        public function set maxFontSize(value:Number):void {
            if (value <= 30) {
                _maxFontSize = value;
            } else _maxFontSize = 30;
        }
        
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
                    // Was Ctrl+Alt+M pressed?  
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