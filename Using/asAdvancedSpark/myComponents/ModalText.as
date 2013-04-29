package myComponents
{
    import flash.events.Event;
    import spark.components.Button;
    import spark.components.RichEditableText;
    import spark.components.supportClasses.SkinnableComponent;

    // ModalText dispatches a change event when the text of the  
    // RichEditableText subcomponent changes. 
    [Event(name="change", type="flash.events.Event")] 
    
    /** a) Extend SkinnableComponent. */ 
    public class ModalText extends SkinnableComponent
    {
        /** b) Implement the constructor. */ 
        public function ModalText() {
            super();
            
            // Set the skinClass style to the name of the skin class.
            setStyle("skinClass", ModalTextSkin);
        }
        
        /** c) Define the skin parts for the Button 
        *     and RichEditableText subcomponents. **/ 
        [SkinPart(required="true")]
        public var modeButton:Button;
        
        [SkinPart(required="true")]
        public var textInput:RichEditableText;
        
        /** d) Implement the commitProperties() method to handle the
        *     change to the ModalText.text property. 
        *     Changes to the ModalText.text property are copied to 
        *     the  RichEditableText subcomponent. */ 
        override protected function commitProperties():void { 
            super.commitProperties(); 
            
            if (bTextChanged) { 
                bTextChanged = false; 
                textInput.text = _text; 
            } 
        }       
        
        /** e) Implement the partAdded() method to
        *     initialize the Button and RichEditableText subcomponents. */ 
        override protected function partAdded(partName:String, instance:Object):void {
            super.partAdded(partName, instance);
        
            if (instance == textInput) {
                textInput.editable = false; 
                textInput.text= _text; 
                textInput.addEventListener("change", textInput_changeHandler); 
            }

            if (instance == modeButton) {
                modeButton.label = "Toggle Editing Mode"; 
                modeButton.addEventListener("click", modeButton_clickHandler); 
            }
        }
        
        /** f) Implement the partRemoved() method to remove the 
        *     event listeners added by partAdded(). */ 
        override protected function partRemoved(partName:String, instance:Object):void {
            super.partRemoved(partName, instance);
        
            if (instance == textInput) {
                textInput.removeEventListener("change", textInput_changeHandler);
            }

            if (instance == modeButton) {
                textInput.removeEventListener("click", modeButton_clickHandler);
            }
        }

        /** g) Add methods, properties, and metadata.
        *     The general pattern for properties is to specify a 
        *     private holder variable. */
        
        // Implement the ModalText.text property. 
        private var _text:String = "ModalText"; 
        private var bTextChanged:Boolean = false; 
        
        // Create a getter/setter pair for the text property. 
        [Bindable] 
        public function set text(t:String):void { 
            _text = t; 
            bTextChanged = true; 
            invalidateProperties(); 
        } 
        
        public function get text():String { 
                return textInput.text; 
        } 
        
        // Dispatch a change event when the RichEditableText.text
        // property changes. 
        private function textInput_changeHandler(eventObj:Event):void { 
                dispatchEvent(new Event("change")); 
        } 
 
        // Handle the Button click event to toggle the 
        // editting mode of the RichEditableText subcomponent. 
        private function modeButton_clickHandler(eventObj:Event):void { 
                textInput.editable = !textInput.editable; 
        } 
    }
}