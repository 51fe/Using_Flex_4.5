// charts/MyColumnChart.as
package {
    import mx.charts.ColumnChart;
    import mx.core.IUIComponent;
    import mx.controls.Image;

    public class MyColumnChart extends ColumnChart {
        [Embed(source="images/dollarSign.png")]
        public var dollarSign:Class;            

        public function MyColumnChart() {
            super();
        }
        
        override protected function get dragImage():IUIComponent {
             var imageProxy:Image = new Image();
             imageProxy.source = dollarSign;
             
             var imageHeight:Number = 50;
             var imageWidth:Number = 32;
             
             imageProxy.height = imageHeight;
             imageProxy.width = imageWidth;

             // Position the image proxy above and to the left of 
             // the mouse pointer.            
             imageProxy.x = this.mouseX - imageWidth;
             imageProxy.y = this.mouseY - imageHeight;

             return imageProxy;
        }
        
    }
}