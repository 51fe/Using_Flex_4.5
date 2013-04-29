package {

import flash.display.GradientType;
import flash.display.Graphics;
import mx.skins.Border;
import mx.styles.StyleManager;
import mx.utils.ColorUtil;
import mx.skins.halo.HaloColors;
import mx.core.UIComponent;

public class IconSkin extends Border {

  public function IconSkin() {
     //super();
  }
    
  override public function get measuredWidth():Number {
     return 14;
  }

  override public function get measuredHeight():Number {
     return 14;
  }
  
  override protected function updateDisplayList(w:Number, h:Number):void {
     super.updateDisplayList(w, h);

     // User-defined styles
     var borderColor:uint = getStyle("borderColor");
     var fillAlphas:Array = getStyle("fillAlphas");
     var fillColors:Array = getStyle("fillColors");
     styleManager.getColorNames(fillColors);
     var highlightAlphas:Array = getStyle("highlightAlphas");       
     var themeColor:uint = getStyle("themeColor");
     
     var r:Number = width / 2;
     
     var upFillColors:Array;
     var upFillAlphas:Array;

     var disFillColors:Array;
     var disFillAlphas:Array;

     var g:Graphics = graphics;
     g.clear();
     
     var myParent:String;
     
     switch (name) {            
        case "upIcon": {
           upFillColors = [ fillColors[0], fillColors[1] ];
           upFillAlphas = [ fillAlphas[0], fillAlphas[1] ];

           if (parent is UIComponent) {
            myParent = String(UIComponent(parent).className);
           }
           if (myParent=="RadioButton") {
            // RadioButton border
            g.beginGradientFill(GradientType.LINEAR, 
                [ borderColor, 0x000000 ], 
                [100,100], [0,0xFF], 
                verticalGradientMatrix(0,0,w,h));
            g.drawCircle(r,r,r);
            g.drawCircle(r,r,(r-1));
            g.endFill();

            // RadioButton fill
            g.beginGradientFill(GradientType.LINEAR, 
                upFillColors, 
                upFillAlphas, 
                [0,0xFF], 
                verticalGradientMatrix(1,1,w-2,h-2));
            g.drawCircle(r,r,(r-1));
            g.endFill();
           } else if (myParent=="CheckBox") {
            // CheckBox border
            drawRoundRect(0,0,w,h,0, 
                [borderColor, 0x000000], 1, 
                verticalGradientMatrix(0,0,w,h), 
                GradientType.LINEAR, 
                null, {x: 1,y:1,w:w-2,h:h-2,r:0});

            // CheckBox fill
            drawRoundRect(1, 1, w-2, h-2, 0, 
                upFillColors, upFillAlphas, 
                verticalGradientMatrix(1,1,w-2,h-2)); 
           }

           // top highlight
           drawRoundRect(1, 1, w-2, 
                (h-2)/2, {tl:r,tr:r,bl:0,br:0},
                [0xFFFFFF, 0xFFFFFF], 
                highlightAlphas, 
                verticalGradientMatrix(0,0,w-2,(h-2)/2)); 
        }
        
        // Insert other cases such as downIcon and overIcon here.
        
     }
  }
}

}