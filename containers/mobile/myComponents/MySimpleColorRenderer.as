package myComponents
{
    // containers\mobile\myComponents\MySimpleColorRenderer .as
    import spark.components.LabelItemRenderer;
    
    public class MySimpleColorRenderer extends LabelItemRenderer
    {
        public function MySimpleColorRenderer() {
            super();
        }
        
        // Use the value of the myColor property to draw 
        // the background color of the item in the list. 
        override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {
            // Define a var to hold the color.
            var myColor:uint;

            // Determine the RGB color value from the label property.
            if (data == "red")
                myColor = 0xFF0000;
            if (data == "green")
                myColor = 0x00FF00;
            if (data == "blue")
                myColor = 0x0000FF;

            graphics.beginFill(myColor, 1);
            graphics.drawRect(0, 0, unscaledWidth, unscaledHeight); 
            
        }
    }
}