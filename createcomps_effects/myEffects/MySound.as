package myEffects
{
   // createcomps_effects/myEffects/MySound.as
   import mx.effects.Effect;
   import mx.effects.EffectInstance;
   import mx.effects.IEffectInstance;

   public class MySound extends Effect
   {
       // Define constructor with optional argument.
       public function MySound(targetObj:Object = null) {
           // Call base class constructor.
           super(targetObj);
           
           // Set instanceClass to the name of the effect instance class.
           instanceClass= MySoundInstance;         
       }
      
       // This effect modifies no properties, so your 
       // override of getAffectedProperties() method 
       // returns an empty array.
       override public function getAffectedProperties():Array {
           return [];
       }
        
       // Override initInstance() method.
       override protected function initInstance(inst:IEffectInstance):void {
           super.initInstance(inst);
       }   
   }
}