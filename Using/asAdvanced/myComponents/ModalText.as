package myComponents
{ 
    // asAdvanced/myComponents/ModalText.as
    // Import all necessary classes.
    import mx.core.UIComponent;
    import mx.controls.Button;
    import mx.controls.TextArea;
    import flash.events.Event;
    import flash.text.TextLineMetrics;

    // ModalText dispatches a change event when the text of the child 
    // TextArea control changes, a textChanged event when you set the text 
    // property of ModalText, and a placementChanged event
    // when you change the textPlacement property of ModalText. 
    [Event(name="change", type="flash.events.Event")]
    [Event(name="textChanged", type="flash.events.Event")]
    [Event(name="placementChanged", type="flash.events.Event")]
    
    /*** a) Extend UIComponent. ***/
    public class ModalText extends UIComponent {

        /*** b) Implement the class constructor. ***/
        public function ModalText() {
            super();
        }


        /*** c) Define variables for the two child components. ***/ 
        // Declare two variables for the component children.
        private var text_mc:TextArea;
        private var mode_mc:Button;

        
        /*** d) Embed new skins used by the Button component. ***/
        // You can create a SWF file that contains symbols  with the names  
        // ModalUpSkin, ModalOverSkin, and ModalDownSkin.       
        // If you do not have skins, comment out these lines.
        [Embed(source="Modal2.swf", symbol="blueCircle")]
        public var modeUpSkinName:Class;
    
        [Embed(source="Modal2.swf", symbol="blueCircle")]
        public var modeOverSkinName:Class;

        [Embed(source="Modal2.swf", symbol="greenSquare")]
        public var modeDownSkinName:Class;


        /*** e) Implement the createChildren() method. ***/
        // Test for the existence of the children before creating them.
        // This is optional, but we do this so a subclass can create a 
        // different child instead.
        override protected function createChildren():void {
            super.createChildren();

            // Create and initialize the TextArea control.      
            if (!text_mc)
            {
                text_mc = new TextArea();
                text_mc.explicitWidth = 80;
                text_mc.editable = false;
                text_mc.text= _text;
                text_mc.addEventListener("change", handleChangeEvent);
                addChild(text_mc);
            }

            // Create and initialize the Button control.        
            if (!mode_mc)
            {   mode_mc = new Button();
                mode_mc.label = "Toggle Editing Mode";
                // If you do not have skins available, 
                // comment out these lines.
                mode_mc.setStyle('overSkin', modeOverSkinName); 
                mode_mc.setStyle('upSkin', modeUpSkinName); 
                mode_mc.setStyle('downSkin', modeDownSkinName); 
                mode_mc.addEventListener("click", handleClickEvent);
                addChild(mode_mc);
            }
        }
        

        /*** f) Implement the commitProperties() method. ***/
        override protected function commitProperties():void {
            super.commitProperties();
            
            if (bTextChanged) {
                bTextChanged = false;
                text_mc.text = _text;
                invalidateDisplayList();
            }
        }       


        /*** g) Implement the measure() method. ***/
        // The default width is the size of the text plus the button.
        // The height is dictated by the button.
        override protected function measure():void {
            super.measure();

            // Since the Button control uses skins, get the 
            // measured size of the Button control. 
            var buttonWidth:Number = mode_mc.getExplicitOrMeasuredWidth();
            var buttonHeight:Number = mode_mc.getExplicitOrMeasuredHeight();

            // The default and minimum width are the measuredWidth 
            // of the TextArea control plus the measuredWidth 
            // of the Button control. 
            measuredWidth = measuredMinWidth = 
                text_mc.measuredWidth + buttonWidth;
            
            // The default and minimum height are the larger of the 
            // height of the TextArea control or the measuredHeight of the 
            // Button control, plus a 10 pixel border around the text. 
            measuredHeight = measuredMinHeight = 
                Math.max(mode_mc.measuredHeight,buttonHeight) + 10;
        }
        
        
        /*** h) Implement the updateDisplayList() method. ***/
        // Size the Button control to the size of its label text 
        // plus a 10 pixel border area. 
        // Size the TextArea to the remaining area of the component.
        // Place the children depending on the setting of 
        // the textPlacement property. 
        override protected function updateDisplayList(unscaledWidth:Number,
                unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);         

            // Subtract 1 pixel for the left and right border, 
            // and use a 3 pixel margin on left and right.
            var usableWidth:Number = unscaledWidth - 8;

            // Subtract 1 pixel for the top and bottom border, 
            // and use a 3 pixel margin on top and bottom.
            var usableHeight:Number = unscaledHeight - 8;
            
            // Calculate the size of the Button control based on its text.
            var lineMetrics:TextLineMetrics = measureText(mode_mc.label);
            // Add a 10 pixel border area around the text.
            var buttonWidth:Number = lineMetrics.width + 10;
            var buttonHeight:Number = lineMetrics.height + 10;
            mode_mc.setActualSize(buttonWidth, buttonHeight);       
            
            // Calculate the size of the text
            // Allow for a 5 pixel gap between the Button 
            // and the TextArea controls. 
            var textWidth:Number = usableWidth - buttonWidth - 5;
            var textHeight:Number = usableHeight;
            text_mc.setActualSize(textWidth, textHeight);
            
            // Position the controls based on the textPlacement property.
            if (textPlacement == "left") {
                text_mc.move(4, 4);
                mode_mc.move(4 + textWidth + 5, 4);
            }
            else {
                mode_mc.move(4, 4);
                text_mc.move(4 + buttonWidth + 5, 4);
            }           
            
            // Draw a simple border around the child components.
            graphics.lineStyle(1, 0x000000, 1.0);
            graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);         
        }
        

        /*** i) Add methods, properties, and metadata. ***/ 
        // The general pattern for properties is to specify a private 
        // holder variable.
        private var _textPlacement:String = "left";
        
        // Create a getter/setter pair for the textPlacement property.
        public function set textPlacement(p:String):void {
            _textPlacement = p;
            invalidateDisplayList();
            dispatchEvent(new Event("placementChanged"));
        }
        
        // The textPlacement property supports data binding.
        [Bindable(event="placementChanged")]
        public function get textPlacement():String {
            return _textPlacement;
        }
        
        private var _text:String = "ModalText";
        private var bTextChanged:Boolean = false;
        
        // Create a getter/setter pair for the text property.
        public function set text(t:String):void {
            _text = t;
            bTextChanged = true;
            invalidateProperties();
            dispatchEvent(new Event("textChanged"));
        }
        
        [Bindable(event="textChanged")]
        public function get text():String {
                return text_mc.text;
        }
        
        // Handle events that are dispatched by the children.
        private function handleChangeEvent(eventObj:Event):void {
                dispatchEvent(new Event("change"));
        }

        // Handle events that are dispatched by the children.
        private function handleClickEvent(eventObj:Event):void {
                text_mc.editable = !text_mc.editable;
        }
    }
}