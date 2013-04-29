package myEffects
{
    // createcomps_effects/myEffects/MySoundInstance.as
    import mx.effects.EffectInstance;
    import flash.media.SoundChannel;
    import flash.media.Sound;

    public class MySoundInstance extends EffectInstance
    {

        // Embed the MP3 file.
        [Embed(source="sample.mp3")]
        [Bindable]
        private var sndCls:Class;
            
        // Define local variables. 
        private var snd:Sound = new sndCls() as Sound; 
        private var sndChannel:SoundChannel;
            
        // Define constructor.
        public function MySoundInstance(targetObj:Object) {
            super(targetObj);
        }

        // Override play() method.
        // Notice that the MP3 file is embedded in the class.
        override public function play():void {
            super.play();
            sndChannel=snd.play();
        }
    
        // Override end() method class to stop the MP3.
        override public function end():void {
            sndChannel.stop();
            super.end();
        }
    }
}