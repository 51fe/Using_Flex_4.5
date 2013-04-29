package myComponents
{
    // containers\mobile\myComponents\MyGroupItemRenderer.as
    import spark.components.LabelItemRenderer;
    import spark.components.supportClasses.StyleableTextField;

    public class MyGroupItemRenderer extends LabelItemRenderer
    {
        public function MyGroupItemRenderer(){
            super();
        }
        
        // Define the StyleableTextField control used 
        // to display the company ID.
        public var compLabelDisplay:StyleableTextField;
        
        // Override createChildren() to create the StyleableTextField control control.
        override protected function createChildren():void {
            super.createChildren();
            
            // Make sure it does not already exist.
            if (!compLabelDisplay) {
                compLabelDisplay = new StyleableTextField();
                
                // Specify The object that provides styles for the control. 
                // This property must be set for the control to pick up 
                // the correct styles. 
                compLabelDisplay.styleName = this;
                
                // Set basic attributes of the control.
                compLabelDisplay.editable = false;
                compLabelDisplay.selectable = false;
                compLabelDisplay.multiline = false;
                compLabelDisplay.wordWrap = false;
                
                // Add the control as a child of the item renderer.
                addChild(compLabelDisplay);
            }
        }
        
        // Override styleChanged() to proopgate style changes to compLabelDisplay.
        override public function styleChanged(styleName:String):void {
            super.styleChanged(styleName);
            
            // Pass any style changes to compLabelDisplay. 
            if (compLabelDisplay)
                compLabelDisplay.styleChanged(styleName);
        }
        
        // Override the data property to initialize compLabelDisplay.
        // The label function in the view specifies the String 
        // displayed in labelDisplay.
        override public function set data(value:Object):void {
            super.data = value;
            
            compLabelDisplay.text = String(value.companyID);
        }
        
        // Override measure() to calculate the size required by the item renderer.
        override protected function measure():void {
            super.measure();
            
            // Commit the styles changes to labelDisplay and compLabelDisplay. 
            // This method must be called before the text is displayed, 
            // and any time the styles have changed. 
            // This method does nothing if the styles have already been committed. 
            labelDisplay.commitStyles();
            compLabelDisplay.commitStyles();
            
            // Becasue of the way the player calculates text widths and heights, 
            // define extra padding around the text to prevent clipping.
            const TEXT_WIDTH_PADDING:int = 5;
            const TEXT_HEIGHT_PADDING:int = 4;
            
            // Calculate the measured width and height of the item renderer, 
            // including text paddding. 
            // Include 6 pixels of extra space around the width, and 10 around 
            // the heiht of the item renderer.
            measuredWidth = Math.max(labelDisplay.textWidth, compLabelDisplay.textWidth) +
                TEXT_WIDTH_PADDING + 6;
            measuredHeight = labelDisplay.textHeight + compLabelDisplay.textHeight +
                TEXT_HEIGHT_PADDING + 10;
            
            // Set the minimum width and height of the item renderer.
            measuredMinWidth = 6;
            measuredMinHeight = 10;
        }
        
        // Override layoutContents() to lay out the item renderer.
        override protected function layoutContents(unscaledWidth:Number, unscaledHeight:Number):void {
            // Because you are handling the layout of both the 
            // predefined labelDisplay component and the new 
            // compLabelDisplay component, you do not have to call
            // super.layoutContents().
            
            // Commit the styles changes to labelDisplay and compLabelDisplay. 
            labelDisplay.commitStyles();
            compLabelDisplay.commitStyles();
            
            // Set the size and position of labelDisplay and compLabelDisplay.
            labelDisplay.x = 3;
            labelDisplay.y = 2;
            labelDisplay.width = unscaledWidth - 6; 
            labelDisplay.height = labelDisplay.textHeight;
            compLabelDisplay.x = 3;
            compLabelDisplay.y = labelDisplay.y + labelDisplay.textHeight + 4;
            compLabelDisplay.width = unscaledWidth - 6; 
            compLabelDisplay.height = compLabelDisplay.textHeight; 
        }
    }
}