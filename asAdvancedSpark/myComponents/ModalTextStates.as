package myComponents
{
    import flash.events.Event;
    import spark.components.Button;
    import spark.components.RichEditableText;
    import spark.components.supportClasses.SkinnableComponent;

    // ModalText dispatches a change event when the text of the  
    // RichEditableText subcomponent changes, 
    // and a placementChanged event
    // when you change the textPlacement property of ModalText.
    [Event(name="change", type="flash.events.Event")] 
    [Event(name="placementChanged", type="flash.events.Event")]

    // Define the skin states implemented by the skin class.
    [SkinState("normal")]
    [SkinState("normalDisabled")]
    [SkinState("textLeft")]
    [SkinState("textLeftDisabled")]
   
    /** a) Extend SkinnableComponent. */ 
    public class ModalTextStates extends SkinnableComponent
    {
        /** b) Implement the constructor. */ 
        public function ModalTextStates() {
            super();
            
            // Set the skin class.
            setStyle("skinClass", ModalTextStatesSkin);
        }
        
        /** C) Define the skin parts. */ 
        [SkinPart(required="true")]
        public var modeButton:Button;
        
        [SkinPart(required="true")]
        public var textInput:RichEditableText;
        
        /** d) Implement the commitProperties() method. */ 
        override protected function commitProperties():void { 
            super.commitProperties(); 
            
            if (bTextChanged) { 
                bTextChanged = false; 
                textInput.text = _text; 
            } 
        }       
        
        /** e) Implement the partAdded() method. */ 
        override protected function partAdded(partName:String, instance:Object):void {
            super.partAdded(partName, instance);
        
            if (instance == textInput) {
                textInput.editable = false; 
                textInput.text= _text; 
                textInput.addEventListener("change", textInput_changeHandler); 
            }

            if (instance == modeButton) {
                modeButton.label = "Toggle Editing Mode"; 
                modeButton.addEventListener("click", modeButton_changeHandler); 
            }
        }
        
        /** f) Implement the partRemoved() method. */ 
        override protected function partRemoved(partName:String, instance:Object):void {
            super.partRemoved(partName, instance);
        
            if (instance == textInput) {
                textInput.removeEventListener("change", textInput_changeHandler);
            }

            if (instance == modeButton) {
                textInput.removeEventListener("click", modeButton_changeHandler);
            }
        }

        /** g) Implement the getCurrentSkinState() method. 
        *     The view state is determined by the _textPlacement property 
        *     and the editable property of the RichEditableText subcomponent.*/ 
        override protected function getCurrentSkinState():String {
            var returnState:String = "normal";
            
            if (textInput.editable == true) 
            {
                if (_textPlacement == "right") {
                    returnState = "normal"; 
                }
                else if (_textPlacement == "left") {
                    returnState = "textLeft"; 
                }
            }

            if (textInput.editable == false) 
            {
                if (_textPlacement == "right") {
                    returnState = "normalDisabled";
                }
                else if (_textPlacement == "left") {
                    returnState = "textLeftDisabled"; 
                }
            }
            return returnState;
        }

        /** h) Add methods, properties, and metadata.  
        *     The general pattern for properties is to specify a private 
        *     holder variable. */
        
        // Define the text property. 
        private var _text:String = "ModalText"; 
        private var bTextChanged:Boolean = false; 
        
        // Then, create a getter/setter pair for the text property. 
        [Bindable] 
        public function set text(t:String):void { 
            _text = t; 
            bTextChanged = true; 
            invalidateProperties(); 
        } 
        
        public function get text():String { 
            return textInput.text; 
        } 

        // Define the textPlacement property. 
        private var _textPlacement:String = "right";
        
        // Create a getter/setter pair for the textPlacement property.
        // Dispatch the placementChanged event when it changes.
        [Bindable]
        public function set textPlacement(p:String):void {
            _textPlacement = p;
            invalidateSkinState();
            dispatchEvent(new Event("placementChanged"));
        }
        
        public function get textPlacement():String {
            return _textPlacement;
        }
        
        // Dispatch a change event when the RichEditableText.text
        // property changes. 
        private function textInput_changeHandler(eventObj:Event):void { 
            dispatchEvent(new Event("change")); 
        } 
 
        // Handle the Button click event to toggle the 
        // editting mode of the RichEditableText subcomponent. 
        private function modeButton_changeHandler(eventObj:Event):void { 
            textInput.editable = !textInput.editable;
            invalidateSkinState(); 
        } 
    }
}