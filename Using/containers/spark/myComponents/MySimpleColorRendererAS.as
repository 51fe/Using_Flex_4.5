package myComponents
{
    import mx.core.UIComponent;    
    import mx.core.IDataRenderer;
    import spark.components.IItemRenderer;
    import flash.events.MouseEvent;
    import mx.events.FlexEvent;
    import spark.components.Label;

    [Event(name="dataChange", type="mx.events.FlexEvent")]
    
    public class MySimpleColorRendererAS extends UIComponent implements IDataRenderer, IItemRenderer
    {
        public function MySimpleColorRendererAS() {
            super();
        }
        
        // Property to hold the RGB color value.
        [Bindable]
        public var myColor:uint;

        // Implement the IItemRenderer.label property. 
        private var _label:String = "";        
        public function get label():String {
            return _label;
        }
        
        // Write String to labelDisplay component.
        // labelDisplay is a Spark Label control. 
        public function set label(value:String):void { 
            if (value == _label)
                return;
            
            _label = value;
            
            if (labelDisplay)
                labelDisplay.text = value;
            
            // Determine the RGB color value from the data item.
            if (value == "red")
                myColor = 0xFF0000;
            if (value == "green")
                myColor = 0x00FF00;
            if (value == "blue")
                myColor = 0x0000FF;
            
            // Cause updateDisplay() to be called to display the item.
            invalidateDisplayList();
        }         
        
        private var _data:Object;
        
        [Bindable("dataChange")]        
        public function get data():Object {
            return _data;
        }
        
        // Implement the IDataRenderer.data property. 
        public function set data(value:Object):void {
            _data = value;
            invalidateProperties();
            
            // Dispatch the dataChange event when the value changes.
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
        
        // Implement the IItemRenderer.itemIndex property. 
        private var _itemIndex:int;
        
        public function get itemIndex():int {
            return _itemIndex;
        }
        
        public function set itemIndex(value:int):void {
            if (value == _itemIndex)
                return;
            
            _itemIndex = value;
            invalidateDisplayList();
        }
        
        // Implement the IItemRenderer.dragging, selected, showsCaret properties. 
        public function get dragging():Boolean {
            return false;
        }
        public function set dragging(value:Boolean):void {}
        
        public function get selected():Boolean {
            return false;
        }
        public function set selected(value:Boolean):void {}

        public function get showsCaret():Boolean {
            return false;
        }
        public function set showsCaret(value:Boolean):void {}

        // Label component to display the contents of the item renderer.
        public var labelDisplay:Label;
        
        // Create the Label component when the item renderer is created.
        override protected function createChildren():void {
            super.createChildren();
            
            if (!labelDisplay) {
                labelDisplay = new Label();
                addChild(labelDisplay);
                if (label != "")
                    labelDisplay.text = label;
            }
        }
        
        // Determine the size of the item renderer.
        override protected function measure():void {
            super.measure();
            
            // label has padding of 3 on left and right and padding of 5 on top and bottom.
            measuredWidth = labelDisplay.getPreferredBoundsWidth() + 6;
            measuredHeight = labelDisplay.getPreferredBoundsHeight() + 10;
            
            measuredMinWidth = labelDisplay.getMinBoundsWidth() + 6;
            measuredMinHeight = labelDisplay.getMinBoundsHeight() + 10;
        }
        
        // Update the dsplay of the item renderer.
        override protected function updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            
            graphics.beginFill(myColor, 1);
            graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);             

            // Make sure our width/height is in the min/max for the Label.
            var childWidth:Number = unscaledWidth - 6;
            childWidth = Math.max(labelDisplay.getMinBoundsWidth(), Math.min(labelDisplay.getMaxBoundsWidth(), childWidth));
            
            var childHeight:Number = unscaledHeight - 10;
            childHeight = Math.max(labelDisplay.getMinBoundsHeight(), Math.min(labelDisplay.getMaxBoundsHeight(), childHeight));
            
            // Set the Label's position and size
            labelDisplay.setLayoutBoundsSize(childWidth, childHeight);
            labelDisplay.setLayoutBoundsPosition(3, 5);
        }
    }
}