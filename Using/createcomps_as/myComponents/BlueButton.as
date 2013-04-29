package myComponents
{
    // createcomps_as/myComponents/BlueButton.as
    import spark.components.Button;

    public class BlueButton extends Button 
    {
    
        public function BlueButton() {
            super();

            // Set the label text to blue.
            setStyle("color", 0x0000FF);

            // Set the borderColor to blue.
            setStyle("fontWeight", "bold");
        }
    }
}