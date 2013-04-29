package myEffects
{
    // createcomps_effects/myEffects/RotationInstance.as
    import mx.effects.effectClasses.TweenEffectInstance;
    import mx.effects.Tween;

    public class RotationInstance extends TweenEffectInstance
    {
        // Define parameters for the effect.
        public var angleFrom:Number;
        public var angleTo:Number;
  
        public function RotationInstance(targetObj:*) {
            super(targetObj);
        }
  
        // Override play() method class.
        override public function play():void {
            // All classes must call super.play().
            super.play();
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
            // must call    super.onTweenEnd().
            super.onTweenEnd(val);
        }
    }
}