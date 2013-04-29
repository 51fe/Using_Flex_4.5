package myOverrides
{
    import flash.display.*;
    import flash.filters.*;
    import mx.core.*;
    import mx.states.*;

    /* State override that adds a Blur effect to a component. */
    public class AddBlur implements IOverride
    {
        /* Constructor. */
        public function AddBlur(
            target:DisplayObject = null)
        {
            this.target = target;
        }
    
        /* The object to blur. */
        public var target:DisplayObject;
    
        /* The initialize() method is empty for this example. */
        public function initialize():void   {
        }

        /* The apply() method adds a BlurFilter to the filters array. */
        public function apply(parent:UIComponent):void {
            var obj:DisplayObject = target ? target : parent;
            var filters:Array = obj.filters;
        
            filters.push(new BlurFilter());
            obj.filters = filters;
        }
    
        /* The remove() method removes the BlurFilter 
           from the filters array. */
        public function remove(parent:UIComponent):void {
            var obj:DisplayObject = target ? target : parent;
            var filters:Array = obj.filters;
        
            filters.pop();
            obj.filters = filters;
        }
    }
}