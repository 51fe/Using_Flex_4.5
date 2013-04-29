package { // Use unnamed package if this skin is not in its own package.
  // skins/CheckBoxAsArrowSkin.as
  
  // Import necessary classes here.
  import flash.display.Graphics;
  import mx.skins.Border;
  import mx.skins.ProgrammaticSkin;
  import mx.styles.StyleManager;

  public class CheckBoxAsArrowSkin extends ProgrammaticSkin {
  
     // Constructor.
     public function CheckBoxAsArrowSkin() {
        // Set default values.
     }

     override protected function updateDisplayList(w:Number, h:Number):void {
        var unscaledHeight:Number = 2;
        var unscaledWidth:Number = 2;

        var arrowColor:Number;

        var g:Graphics = graphics;
        g.clear();

        switch (name) {
           case "upIcon": 
           case "selectedUpIcon": {
            arrowColor = 0x666666;
            break;
           }
           case "overIcon": 
           case "downIcon": 
           case "selectedOverIcon": 
           case "selectedDownIcon": {
            arrowColor = 0xCCCCCC;
            break;
           }
        }

        // Draw an arrow.
        graphics.lineStyle(1, 1, 1);
        graphics.beginFill(arrowColor);
        graphics.moveTo(unscaledWidth, unscaledHeight-20);
        graphics.lineTo(unscaledWidth-30, unscaledHeight+20);
        graphics.lineTo(unscaledWidth+30, unscaledHeight+20);
        graphics.lineTo(unscaledWidth, unscaledHeight-20);
        graphics.endFill();
     }
  }
} // Close unnamed package.