package myComponents
{
    // createcomps_as/myComponents/HGroupWithAlert.as
    import mx.controls.Alert;
    import spark.components.HGroup;
    import mx.core.IVisualElement;

    public class HGroupWithAlert extends HGroup
    {
        // Define the constructor.  
        public function HGroupWithAlert() {
            super();
        }       

      // Define the override.
      override public function addElement(child:IVisualElement):IVisualElement {
        
            // Call super.addChild().
            super.addElement(child); 
            
            // Open the Alert box.
            Alert.show("Item added successfully");

            return child;
        }
    }
}