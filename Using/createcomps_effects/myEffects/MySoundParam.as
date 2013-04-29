package myEffects
{
    // createcomps_effects/myEffects/MySoundParam.as
    import mx.effects.Effect;
    import mx.effects.EffectInstance;
    import mx.effects.IEffectInstance;

    public class MySoundParam extends Effect
    {
    
       // Define a variable for the MP3 URL
       // and give it a default value.
       public var soundMP3:String=
           "http://localhost:8100/flex/assets/default.mp3";
    
       // Define constructor with optional argument.
       public function MySoundParam(targetObj:Object = null) {
           // Call base class constructor.
           super(targetObj);

           // Set instanceClass to the name of the effect instance class.
          instanceClass= MySoundParamInstance;            
       }

       // Override getAffectedProperties() method to return an empty array.
       override public function getAffectedProperties():Array {
           return [];
       }
    
       // Override initInstance() method.
       override protected function initInstance(inst:IEffectInstance):void {
           super.initInstance(inst);
           // initialize the corresponding parameter in the instance class.
           MySoundParamInstance(inst).soundMP3 = soundMP3;     
       } 
   }
}