package myEffects
{
    // createcomps_effects/myEffects/RotationTransInstance.as
    import mx.effects.effectClasses.TweenEffectInstance;
    import mx.effects.Tween;

    public class RotationTransInstance extends TweenEffectInstance
    {
        // Define parameters for the effect.
        public var angleFrom:Number;
        public var angleTo:Number;
  
        public function RotationTransInstance(targetObj:Object) {
            super(targetObj);
        }
  
        // Override play() method class.
        override public function play():void {
            // All classes must call super.play().
            super.play();
            
            // Check whether angleFrom is set.
            if (isNaN(angleFrom)) 
            {
              // If not, look in propertyChanges.start for a value. 
              // Otherwise, set it to 0.
              angleFrom = (propertyChanges.start["rotation"] != undefined) ? 
                    propertyChanges.start["rotation"] : 0;

            }
                    
            // Check whether angleTo is set.
            if (isNaN(angleTo)) 
            {
                // If not, look in propertyChanges.end for a value. 
                // Otherwise, set it to 360.
                angleTo = (propertyChanges.end["rotation"] != undefined) ? 
                    propertyChanges.end["rotation"] : 360;
            }
            
            // Create a Tween object. The tween begins playing immediately.
            var tween:Tween = 
                createTween(this, angleFrom, angleTo, duration);  
        }

        // Override onTweenUpdate() method.
        override public function onTweenUpdate(val:Object):void {
            target.rotation = val;
        }
  
        // Override onTweenEnd() method.
        override public function onTweenEnd(val:Object):void {
            // All classes that implement onTweenEnd() 
            // must call super.onTweenEnd().
            super.onTweenEnd(val);
        }
    }
}