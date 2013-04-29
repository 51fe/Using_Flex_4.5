package { // Use unnamed package if this skin is not in its own package.
  // skins/ButtonStatesWithBorderMetricsSkin.as

  // Import necessary classes here.
  import flash.display.Graphics;
  import mx.skins.Border;
  import mx.skins.ProgrammaticSkin;
  import mx.styles.StyleManager;
  import mx.core.EdgeMetrics;

  public class ButtonStatesWithBorderMetricsSkin extends ProgrammaticSkin {

     public var backgroundFillColor:Number;
     public var lineThickness:Number;

     private var _borderMetrics:EdgeMetrics;

     // Constructor.
     public function ButtonStatesWithBorderMetricsSkin() {
        // Set default values.
        backgroundFillColor = 0xFFFFFF;
        lineThickness = 4;
     }

     public function get borderMetrics():EdgeMetrics {
        if (_borderMetrics) {
           return _borderMetrics;
        }
        var borderThickness:Number = getStyle("borderThickness");
        _borderMetrics = new EdgeMetrics(borderThickness, 
            borderThickness, borderThickness, borderThickness);
        return _borderMetrics;
     }

     override protected function updateDisplayList(w:Number, h:Number):void 
     {
        // Depending on the skin's current name, set values for this skin.
        switch (name) {
           case "upSkin":
            lineThickness = 4;
            backgroundFillColor = 0xFFFFFF;
            break;
           case "overSkin":
            lineThickness = 4;
            backgroundFillColor = 0xCCCCCC;
            break;
           case "downSkin":
            lineThickness = 2;
            backgroundFillColor = 0xFFFFFF;
            break;
           case "disabledSkin":
            lineThickness = 2;
            backgroundFillColor = 0xCCCCCC;
            break;
        }

        // Draw the box using the new values.
        var g:Graphics = graphics;
        g.clear();
        g.beginFill(backgroundFillColor,1.0);
        g.lineStyle(lineThickness, 0xFF0000);
        g.drawRect(0, 0, w, h);
        g.endFill();
        g.moveTo(0, 0);
        g.lineTo(w, h);
        g.moveTo(0, h);
        g.lineTo(w, 0);
     }
  }
} // Close unnamed package.