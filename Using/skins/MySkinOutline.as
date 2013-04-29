package { // Use unnamed package if this skin is not in its own package.
  // skins/MySkinOutline.as
  
  // Import necessary classes here.
  import flash.display.Graphics;
  import mx.skins.Border;
  import mx.skins.ProgrammaticSkin;
  import mx.styles.StyleManager;

  // Extend ProgrammaticSkin.
  public class MySkinOutline extends ProgrammaticSkin {

     // Constructor.
     public function MySkinOutline() {
        // Set default values here.
     }

     // Override updateDisplayList().
     override protected function updateDisplayList(w:Number, 
        h:Number):void {
        // Add styleable properties here.
        // Add logic to detect component’s state and set properties here.
        // Add drawing methods here.
     }
  }
} // Close unnamed package.