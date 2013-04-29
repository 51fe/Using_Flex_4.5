////////////////////////////////////////////////////////////////////////////////
//
//  Copyright (C) 2003-2005 Macromedia, Inc. All Rights Reserved.
//  The following is Sample Code and is subject to all restrictions
//  on such code as contained in the End User License Agreement
//  accompanying this product.
//
////////////////////////////////////////////////////////////////////////////////

package
{

import flash.display.Graphics;
import flash.filters.DropShadowFilter;
import mx.core.EdgeMetrics;
import mx.graphics.RectangularDropShadow;
import mx.skins.RectangularBorder;

/**
 *  The skin for a ToolTip.
 */
public class MyToolTipBorder extends RectangularBorder
{
    //include "../../core/Version.as";

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  Constructor.
     */
    public function MyToolTipBorder() 
    {
        super(); 
    }

    //--------------------------------------------------------------------------
    //
    //  Variables
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     */
    private var dropShadow:RectangularDropShadow;
    
    //--------------------------------------------------------------------------
    //
    //  Overridden properties
    //
    //--------------------------------------------------------------------------

    //----------------------------------
    //  borderMetrics
    //----------------------------------

    /**
     *  @private
     *  Storage for the borderMetrics property.
     */
    private var _borderMetrics:EdgeMetrics;

    /**
     *  @private
     */
    override public function get borderMetrics():EdgeMetrics
    {       
        if (_borderMetrics)
            return _borderMetrics;
            
        var borderStyle:String = getStyle("borderStyle");
        switch (borderStyle)
        {
            case "errorTipRight":
            {
                _borderMetrics = new EdgeMetrics(15, 1, 3, 3);
                break;
            }
            
            case "errorTipAbove":
            {
                _borderMetrics = new EdgeMetrics(3, 1, 3, 15);
                break;
            }
        
            case "errorTipBelow":
            {
                _borderMetrics = new EdgeMetrics(3, 13, 3, 3);
                break;
            }
            
            default: // "toolTip"
            {
                _borderMetrics = new EdgeMetrics(3, 1, 3, 3);
                break;
            }
        }
        
        return _borderMetrics;
    }

    //--------------------------------------------------------------------------
    //
    //  Overridden methods
    //
    //--------------------------------------------------------------------------

    /**
     *  @private
     *  If borderStyle may have changed, clear the cached border metrics.
     */
    override public function styleChanged(styleProp:String):void
    {
        if (styleProp == "borderStyle" ||
            styleProp == "styleName" ||
            styleProp == null)
        {
            _borderMetrics = null;
        }
        
        invalidateDisplayList();
    }

    /**
     *  @private
     *  Draw the background and border.
     */
    override protected function updateDisplayList(w:Number, h:Number):void
    {   
        super.updateDisplayList(w, h);

        var borderStyle:String = getStyle("borderStyle");
        //var backgroundColor:uint = getStyle("backgroundColor");
        var backgroundColor:uint = 0x666600;
        var borderColor:uint = getStyle("borderColor");
        var shadowColor:uint = getStyle("shadowColor");
        var shadowAlpha:Number = 0.1;

        var g:Graphics = graphics;
        g.clear();
        
        filters = [];

        switch (borderStyle)
        {
            case "toolTip":
            {
        
                var highlightAlphas:Array = [0.3,0.0];
                drawRoundRect(3, 1, w - 6, h - 4, 2,[0xFF0000, 0xFFFFBB], 1);

                //drawRoundRect(x + 2, y + 2, w - 4, h - 4, 0,[ 0xFF0000, 0xFFFF00, 0x0000FF ] , 1,verticalGradientMatrix(x + 2, y + 2, w - 4, h - 4));

                if (!dropShadow)
                    dropShadow = new RectangularDropShadow();

                dropShadow.distance = 3;
                dropShadow.angle = 90;
                dropShadow.color = 0;
                dropShadow.alpha = 0.4;

                dropShadow.tlRadius = 4;
                dropShadow.trRadius = 4;
                dropShadow.blRadius = 4;
                dropShadow.brRadius = 4;

                dropShadow.drawShadow(graphics, 3, 0, w - 6, h - 4);

                break;
            }

            case "errorTipRight":
            {
                // border 
                drawRoundRect(
                    11, 0, w - 11, h - 2, 3,
                    borderColor, 0.95); 

                // left pointer 
                g.beginFill(borderColor, 0.95);
                g.moveTo(11, 7);
                g.lineTo(0, 13);
                g.lineTo(11, 19);
                g.moveTo(11, 7);
                g.endFill();
                
                filters = [ new DropShadowFilter(2, 90, 0, 0.4) ];
                break;
            }

            case "errorTipAbove":
            {
                // border 
                drawRoundRect(
                    0, 0, w, h - 13, 3,
                    borderColor, 0.95); 

                // bottom pointer 
                g.beginFill(borderColor, 0.95);
                g.moveTo(9, h - 13);
                g.lineTo(15, h - 2);
                g.lineTo(21, h - 13);
                g.moveTo(9, h - 13);
                g.endFill();

                filters = [ new DropShadowFilter(2, 90, 0, 0.4) ];
                break;
            }

            case "errorTipBelow":
            {
                // border 
                drawRoundRect(
                    0, 11, w, h - 13, 3,
                    borderColor, 0.95); 

                // top pointer 
                g.beginFill(borderColor, 0.95);
                g.moveTo(9, 11);
                g.lineTo(15, 0);
                g.lineTo(21, 11);
                g.moveTo(10, 11);
                g.endFill();
                
                filters = [ new DropShadowFilter(2, 90, 0, 0.4) ];
                break;
            }
        }
    }
}

}
