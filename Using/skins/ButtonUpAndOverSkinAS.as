package { 
  // skins\ButtonUpAndOverSkinAS.as

  import mx.skins.ProgrammaticSkin;

  public class ButtonUpAndOverSkinAS extends ProgrammaticSkin {

    // Constructor.
    public function ButtonUpAndOverSkinAS() {
      super();
    }

    override protected function updateDisplayList(unscaledWidth:Number, 
      unscaledHeight:Number):void 
    {      
      switch (name)
      {            
       case "upSkin": {
        graphics.lineStyle(1, 0x0066FF);
        graphics.beginFill(0x00FF00, 0.50);
        graphics.drawRoundRect(0, 0, unscaledWidth, unscaledHeight, 10, 10);
       }

       case "overSkin": {
        graphics.lineStyle(1, 0x0066FF);
        graphics.beginFill(0x00CCFF, 0.50);
        graphics.drawRoundRect(0, 0, unscaledWidth, unscaledHeight, 10, 10);
       }       
      }
    }
  }
}