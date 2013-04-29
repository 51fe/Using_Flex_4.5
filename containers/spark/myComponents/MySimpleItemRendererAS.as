package myComponents
{
    import flash.events.MouseEvent;
    
    import mx.core.UIComponent;
    import mx.core.IDataRenderer;
    import spark.components.IItemRenderer;
    import mx.events.FlexEvent;
    import spark.components.Label;
    import spark.components.HGroup;

    [Event(name="dataChange", type="mx.events.FlexEvent")]
    
    public class MySimpleItemRendererAS extends UIComponent implements IDataRenderer, IItemRenderer
    {
        public function MySimpleItemRendererAS() {
            super();
        }
        
        private var _label:String = "";
        
        public function get label():String {
            return _label;
        }
        
        // Write String to labelDisplay component. 
        public function set label(value:String):void { 
            if (value == _label)
                return;
            
            _label = value;
        }         
        
        // Implement the data property to write the fields 
        // of the Object to the Label controls. 
        private var _data:Object;
        
        [Bindable("dataChange")]        
        public function get data():Object {
            return _data;
        }
        
        public function set data(value:Object):void {
            if (value== null) 
                return; 

            _data = value;

            // Set the two Label controls based on the data item.
            nameLabel.text = value.firstName + ', ' + value.lastName;
            compLabel.text = value.companyID;
            
            invalidateProperties();
            dispatchEvent(new FlexEvent(FlexEvent.DATA_CHANGE));
        }
        
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
        
        // Implement the selected property becasue List supports
        // selecting data items. 
        private var _selected:Boolean = false;

        public function get selected():Boolean
        {
            return _selected;
        }
        
        public function set selected(value:Boolean):void
        {
            if (value != _selected)
            {
                _selected = value; 
                invalidateDisplayList();
            }
        }

        public function get dragging():Boolean {
            return false;
        }
        public function set dragging(value:Boolean):void {}
        
        public function get showsCaret():Boolean {
            return false;
        }
        public function set showsCaret(value:Boolean):void {}

        // Define the children of the item renderer used to display 
        // the data item. 
        // In this example, display two label controls in an HGroup container.
        public var myHGroup:HGroup;
        public var nameLabel:Label;
        public var compLabel:Label;
        
        override protected function createChildren():void {
            super.createChildren();
            
            // Create the HGroup and Label controls. 
            if (!myHGroup) {
                myHGroup = new HGroup();
                addChild(myHGroup);
            }
            
            if (!nameLabel) {
                nameLabel = new Label();
                myHGroup.addElement(nameLabel);
            }
            
            if (!compLabel) {
                compLabel = new Label();
                myHGroup.addElement(compLabel);
            }
        }
        
        override protected function measure():void {
            super.measure();
            
            measuredWidth = myHGroup.getPreferredBoundsWidth() + 6;
            measuredHeight = myHGroup.getPreferredBoundsHeight() + 10;
            
            measuredMinWidth = myHGroup.getMinBoundsWidth() + 6;
            measuredMinHeight = myHGroup.getMinBoundsHeight() + 10;
        }
        
        override protected function updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            
            var backgroundColor:uint;
            if (selected)
                backgroundColor = getStyle("selectionColor");
            else
                backgroundColor = getStyle("contentBackgroundColor");

            graphics.beginFill(backgroundColor, 1);
            graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);             
            
            // make sure our width/height is in the min/max for the label
            var childWidth:Number = unscaledWidth - 6;
            childWidth = Math.max(myHGroup.getMinBoundsWidth(), Math.min(myHGroup.getMaxBoundsWidth(), childWidth));
            
            var childHeight:Number = unscaledHeight - 10;
            childHeight = Math.max(myHGroup.getMinBoundsHeight(), Math.min(myHGroup.getMaxBoundsHeight(), childHeight));
            
            // set the label's position and size
            myHGroup.setLayoutBoundsSize(childWidth, childHeight);
            myHGroup.setLayoutBoundsPosition(3, 5);
        }
    }
}