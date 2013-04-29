package myComponents
{
    // asAdvanced/myComponents/BlueButton.as
    import mx.controls.Button;

    public class BlueButton extends Button {
    
        public function BlueButton() {
            super();
        }

        override protected function measure():void {
            super.measure();
    
            measuredWidth=100;
            measuredMinWidth=50;
            measuredHeight=50;
            measuredMinHeight=25;
        }
    }
}