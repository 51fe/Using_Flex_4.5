package myComponents
{
    // createcomps_as/myComponents/MyPanel.as
    import spark.components.Panel;
    import spark.components.TextInput;

    public class MyPanel extends Panel {

        // Define public variables for two child components.    
        public var myInput:TextInput;
        public var myOutput:TextInput;

        public function MyPanel() {
            super();
        }

        // Copy the text from one child component to another.    
        public function xfer():void {
            myOutput.text = myInput.text;
        }
    }
}