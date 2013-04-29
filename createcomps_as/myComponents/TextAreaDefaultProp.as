package myComponents
{
    // createcomps_as/myComponents/TextAreaDefaultProp.as
    import spark.components.TextArea;

    // Define the default property.
    [DefaultProperty("defaultText")]

    public class TextAreaDefaultProp extends TextArea {
    
        public function TextAreaDefaultProp() 
        {
            super();
        }       

        // Define a setter method to set the text property
        // to the value of the default property.
        public function set defaultText(value:String):void {
            if (value!=null)
            text=value;
        }

        public function get defaultText():String {
            return text;
        }
    }    
}