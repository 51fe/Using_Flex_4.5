package myComponents
{
    // createcomps_as/myComponents/HBoxWithAlert.as
    import mx.controls.Alert;
    import mx.containers.HBox;
    import flash.display.DisplayObject;

    public class HBoxWithAlert extends HBox
    {
        // Define the constructor.  
        public function HBoxWithAlert() 
        {
            super();
        }       

      // Define the override.
      override public function addChild(child:DisplayObject):DisplayObject {
        
            // Call super.addChild().
            super.addChild(child); 
            
            // Open the Alert box.
            Alert.show("Item added successfully");

            return child;
        }
    }
}