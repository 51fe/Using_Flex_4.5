package myComponents 
{
    // skinstyle/myComponents/StyledRectangle.as
    import mx.core.UIComponent;
    import mx.styles.CSSStyleDeclaration;
    import mx.styles.StyleManager;
    import flash.display.GradientType;
    import mx.core.FlexGlobals;

    // Insert the [Style] metadata tag to define the name, type 
    // and other information about the style property for the 
    // MXML compiler.
    [Style(name="fillColors",type="Array",format="Color",inherit="no")]
    [Style(name="alphas",type="Array",format="Number",inherit="no")]

    public class StyledRectangle extends UIComponent
    {    
        // Define a static variable.
        private static var classConstructed:Boolean = classConstruct();
    
        // Define a static method.
        private static function classConstruct():Boolean {
            if (!FlexGlobals.topLevelApplication.styleManager.getStyleDeclaration("myComponents.StyledRectangle"))
            {
                // If there is no CSS definition for StyledRectangle, 
                // then create one and set the default value.
                var myRectStyles:CSSStyleDeclaration = new CSSStyleDeclaration();
                myRectStyles.defaultFactory = function():void
                {
                    this.fillColors = [0xFF0000, 0x0000FF];
                    this.alphas = [0.5, 0.5];
                }
                FlexGlobals.topLevelApplication.styleManager.setStyleDeclaration("myComponents.StyledRectangle", myRectStyles, true);

            }
            return true;
        }
    
        // Constructor  
        public function StyledRectangle() {
            super();    
        }           
    
        // Define a default size of 100 x 100 pixels.
        override protected function measure():void {
            super.measure();

            measuredWidth = measuredMinWidth = 100;
            measuredHeight = measuredMinHeight = 100;
        }

        // Define the flag to indicate that a style property changed.
        private var bStypePropChanged:Boolean = true;

        // Define the variable to hold the current gradient fill colors.
        private var fillColorsData:Array;

        // Define the variable to hold the current alpha values.
        private var alphasData:Array;

        // Define the variable for additional control on the fill.
        // You can create a style property for this as well.
        private var ratios:Array = [0x00, 0xFF];
        
        // Override the styleChanged() method to detect changes in your new style.
        override public function styleChanged(styleProp:String):void {

            super.styleChanged(styleProp);

            // Check to see if style changed. 
            if (styleProp=="fillColors" || styleProp=="alphas") 
            {
                bStypePropChanged=true; 
                invalidateDisplayList();
                return;
            }
        }
    
    
        // Override updateDisplayList() to update the component 
        // based on the style setting.
        override protected function updateDisplayList(unscaledWidth:Number,
                unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);

            // Check to see if style changed. 
            if (bStypePropChanged==true) 
            {
                // Redraw gradient fill only if style changed.
                fillColorsData=getStyle("fillColors");
                alphasData=getStyle("alphas");
                
                graphics.beginGradientFill(GradientType.LINEAR, 
                    fillColorsData, alphasData, ratios);  
                graphics.drawRect(0, 0, unscaledWidth, unscaledHeight);
                
                bStypePropChanged=false;
            }
        }
    }
}