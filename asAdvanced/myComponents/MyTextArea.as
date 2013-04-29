package myComponents
{ 
    // asAdvanced/myComponents/MyTextArea.as
    import mx.controls.TextArea;
    import flash.text.TextLineMetrics;

    public class MyTextArea extends TextArea
    {

        public function MyTextArea() {
            super();
        }
        
        // The default size is the size of the text plus a 10 pixel margin.
        override protected function measure():void {
            super.measure();

            // Calculate the default size of the control based on the 
            // contents of the TextArea.text property.
            var lineMetrics:TextLineMetrics = measureText(text);
            // Add a 10 pixel border area around the text.
            measuredWidth = measuredMinWidth = lineMetrics.width + 10;
            measuredHeight = measuredMinHeight = lineMetrics.height + 10;
        }
    }
}