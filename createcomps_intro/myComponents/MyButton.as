package myComponents
{
    // createcomps_intro/myComponents/MyButton.as
    import spark.components.Button;

    public class MyButton extends Button {
    
        // Define the constructor. 
        public function MyButton() {
            // Call the constructor in the superclass. 
            super();
            // Set the label property to "Submit".
            label="Submit";
        }
    }
}