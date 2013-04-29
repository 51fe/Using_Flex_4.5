package myEffects
{
   // createcomps_effects/myEffects/Rotation.as
   import mx.effects.TweenEffect;
   import mx.effects.EffectInstance;
   import mx.effects.IEffectInstance;

   public class Rotation extends TweenEffect
   {
       // Define parameters for the effect.
       public var angleFrom:Number = 0;
       public var angleTo:Number = 360;
  
       // Define constructor with optional argument.
       public function Rotation(targetObj:* = null) {
           super(targetObj);
           instanceClass= RotationInstance;            
       }

       // Override getAffectedProperties() method to return "rotation".
       override public function getAffectedProperties():Array {
           return ["rotation"];
       }
    
       // Override initInstance() method.
       override protected function initInstance(inst:IEffectInstance):void {
           super.initInstance(inst);
           RotationInstance(inst).angleFrom = angleFrom;
           RotationInstance(inst).angleTo = angleTo;
       } 
   }
}