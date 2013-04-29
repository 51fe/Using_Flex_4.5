// charts/CycleColorRenderer.as

package { // Empty package.
  
  import mx.charts.series.items.ColumnSeriesItem;
  import mx.skins.ProgrammaticSkin;
  import mx.core.IDataRenderer;
  import flash.display.Graphics;
  
  public class CycleColorRenderer extends mx.skins.ProgrammaticSkin 
     implements IDataRenderer {
     
     private var colors:Array = [0xCCCC99,0x999933,0x999966];
     private var _chartItem:ColumnSeriesItem;
     
     public function CycleColorRenderer() {
        // Empty constructor.
     }
     
     public function get data():Object {
        return _chartItem;
     }

     public function set data(value:Object):void {
        _chartItem = value as ColumnSeriesItem; 
        invalidateDisplayList();
     }

     override protected function
        updateDisplayList(unscaledWidth:Number,unscaledHeight:Number):void {
           super.updateDisplayList(unscaledWidth, unscaledHeight);
           var g:Graphics = graphics;
           g.clear();  
           g.beginFill(colors[(_chartItem == null)? 0:_chartItem.index]);
           g.drawRect(0, 0, unscaledWidth, unscaledHeight);
           g.endFill();
     }
  } // Close class.
} // Close package.