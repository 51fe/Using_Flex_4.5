package { // Use unnamed package if this skin is not in its own package.
  // skins/CheckboxSkin.as
  
  // Import necessary classes here.
  import flash.display.Graphics;
  import mx.skins.Border;
  import mx.skins.ProgrammaticSkin;
  import mx.styles.StyleManager;

  public class CheckboxSkin extends ProgrammaticSkin {

     // Constructor.
     public function CheckboxSkin() {
        // Set default values here.
     }

  override protected function updateDisplayList(w:Number, h:Number):void {
     var g:Graphics = graphics;
     g.clear();
     g.beginFill(0xFFFFFF,1.0);
     g.lineStyle(2, 0xFF0000);
     g.drawRect(0, 0, w, h);
     g.endFill();
     g.moveTo(0, 0);
     g.lineTo(w, h);
     g.moveTo(0, h);
     g.lineTo(w, 0);
  }
  }
} // Close unnamed package.