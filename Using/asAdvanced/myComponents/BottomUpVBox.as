package myComponents
{ 
    // asAdvanced/myComponents/BottomUpVBox.as
    import mx.containers.VBox;
    import mx.core.EdgeMetrics;
    import mx.core.UIComponent;

    public class BottomUpVBox extends VBox
    {
    
        public function BottomUpVBox() {
            super();
        }
        
        override protected function updateDisplayList(unscaledWidth:Number,
            unscaledHeight:Number):void {

            super.updateDisplayList(unscaledWidth, unscaledHeight);
    
            // Get information about the container border area. 
            // The usable area of the container for its children is the 
            // container size, minus any border areas.
            var vm:EdgeMetrics = viewMetricsAndPadding;

            // Get the setting for the vertical gap between children.
            var gap:Number = getStyle("verticalGap");
    
            // Determine the y coordinate of the bottom of the usable area 
            // of the VBox.
            var yOfComp:Number = unscaledHeight-vm.bottom;
            
            // Temp variable for a container child.
            var obj:UIComponent;
                
            for (var i:int = 0; i < numChildren; i++)
            {
                // Get the first container child.
                obj = UIComponent(getChildAt(i));
            
                // Determine the y coordinate of the child.
                yOfComp = yOfComp - obj.height;
                
                // Set the x and y coordinate of the child.
                // Note that you do not change the x coordinate.
                obj.move(obj.x, yOfComp);
                
                // Save the y coordinate of the child,  
                // plus the vertical gap between children. 
                // This is used to calculate the coordinate 
                // of the next child. 
                yOfComp = yOfComp - gap;
            }
        }
    }
}