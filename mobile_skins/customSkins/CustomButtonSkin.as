package customSkins {   
    import mx.utils.ColorUtil;
    import spark.skins.mobile.ButtonSkin;
    import flash.display.GradientType;
    import spark.skins.mobile.supportClasses.MobileSkin;
    import flash.geom.Matrix;

    public class CustomButtonSkin extends ButtonSkin {
        
        public function CustomButtonSkin() {
            super();
        }

        private static var colorMatrix:Matrix = new Matrix();
        private static const CHROME_COLOR_ALPHAS:Array = [1, 1];
        private static const CHROME_COLOR_RATIOS:Array = [0, 127.5];        
        
        override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void {
            super.drawBackground(unscaledWidth, unscaledHeight);        
            
            var chromeColor:uint = getStyle("chromeColor");
            /*
            if (currentState == "down") {
                graphics.beginFill(chromeColor);
            } else {            
            */      
            var colors:Array = [];
            colorMatrix.createGradientBox(unscaledWidth, unscaledHeight, Math.PI / 2, 0, 0);
            colors[0] = ColorUtil.adjustBrightness2(chromeColor, 70);
            colors[1] = chromeColor;    
            graphics.beginGradientFill(GradientType.RADIAL, colors, CHROME_COLOR_ALPHAS, CHROME_COLOR_RATIOS, colorMatrix);
            // }            
            graphics.drawRoundRect(layoutBorderSize, layoutBorderSize, 
                unscaledWidth - (layoutBorderSize * 2), 
                unscaledHeight - (layoutBorderSize * 2), 
                layoutCornerEllipseSize, layoutCornerEllipseSize);
            graphics.endFill();
        }
        
    }
}