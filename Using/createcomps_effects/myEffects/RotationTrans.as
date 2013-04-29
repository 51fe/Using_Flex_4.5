package myEffects
{
   // createcomps_effects/myEffects/RotationTrans.as
   import mx.effects.TweenEffect;
   import mx.effects.EffectInstance;
   import mx.effects.IEffectInstance;

   public class RotationTrans extends TweenEffect
   {
       // Define parameters for the effect.
       // Do not specify any default values. 
       // The default value of these properties is NaN.
       public var angleFrom:Number;
       public var angleTo:Number;
 
       // Define constructor with optional argument.
       public function RotationTrans(targetObj:Object = null) {
           super(targetObj);
           instanceClass= RotationTransInstance;           
       }

       // Override getAffectedProperties() method to return "rotation".
       override public function getAffectedProperties():Array {
           return ["rotation"];
       }
    
       // Override initInstance() method.
       override protected function initInstance(inst:IEffectInstance):void {
           super.initInstance(inst);
           RotationTransInstance(inst).angleFrom = angleFrom;
           RotationTransInstance(inst).angleTo = angleTo;
       } 
   }
}