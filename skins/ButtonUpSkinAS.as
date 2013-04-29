package { 
  // skins\ButtonUpSkinAS.as

  import mx.skins.ProgrammaticSkin;

  public class ButtonUpSkinAS extends ProgrammaticSkin {

    // Constructor.
    public function ButtonUpSkinAS() {
      super();
    }

    override protected function updateDisplayList(unscaledWidth:Number, 
      unscaledHeight:Number):void 
    {
      graphics.lineStyle(1, 0x0066FF);
      graphics.beginFill(0x00FF00, 0.50);
      graphics.drawRoundRect(0, 0, unscaledWidth, unscaledHeight, 10, 10);
    }
  }
}