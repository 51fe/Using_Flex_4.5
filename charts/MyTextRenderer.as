// charts/MyTextRenderer.as
package {
    import mx.charts.chartClasses.ChartLabel;
    import mx.charts.*;
    import flash.display.*; 
    import flash.geom.Matrix;
    
    public class MyTextRenderer extends ChartLabel {
        public function MyTextRenderer() {
            super();            
        }       
        
        override protected function updateDisplayList(w:Number, h:Number):void {
            super.updateDisplayList(w, h);
            
            this.setStyle("textAlign","center");
            var g:Graphics = graphics; 
            g.clear();  
            var m:Matrix = new Matrix();
            m.createGradientBox(w+100,h,0,0,0);
            g.beginGradientFill(GradientType.LINEAR,[0xFF0000,0xFFFFFF],
                [.1,1],[0,255],m,null,null,0);
            g.drawRect(-50,0,w+100,h);
            g.endFill(); 
        }
    }
}