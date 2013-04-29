// agent/MyVGroup.as
package { // Empty package
    import mx.core.UIComponent;
    import spark.components.VGroup;
    import spark.components.Button;
    import mx.automation.IAutomationObject;
    import spark.automation.delegates.components.SparkGroupAutomationImpl;

    public class MyVGroup extends VGroup {
        public var btnOk : Button;
        public var btnHelp : Button;
        public var btnCancel : Button;

        public function MyVGroup():void { // Constructor
        } 
        
        override protected function createChildren():void {
            super.createChildren();
                
            btnOk = new Button();
            btnOk.label = "OK";
            btnOk.automationName = "OK_custom_form";
            addElement(btnOk);
    
            btnCancel = new Button();
            btnCancel.label = "Cancel";
            btnCancel.automationName = "Cancel_custom_form";
            addElement(btnCancel);
    
            btnHelp = new Button();
            btnHelp.label = "Help";
            btnHelp.showInAutomationHierarchy = false;
            addElement(btnHelp);      
        } 
        
        override public function get numAutomationChildren():int {
            return 2; //instead of 3
        }

        override public function 
            getAutomationChildAt(index:int):IAutomationObject {
            switch(index) {
                case 0:
                    return btnOk;
                case 1:
                    return btnCancel;
            }
            return null;
        }                
    } // Class
} // Package