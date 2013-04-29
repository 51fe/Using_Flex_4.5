// compilers/MyButton.as
package  {
    import mx.controls.Button;

    CONFIG::debugging
    public class MyButton extends Button {    
        public function MyButton() {
            super();
            // Set the label text to blue.
            setStyle("color", 0x0000FF);
        }
    }

    CONFIG::release
    public class MyButton extends Button {    
        public function MyButton() {
            super();
            // Set the label text to red.
            setStyle("color", 0xFF0000);
        }
    }
}