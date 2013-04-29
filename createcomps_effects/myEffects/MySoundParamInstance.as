package myEffects
{
    // createcomps_effects/myEffects/MySoundParamInstance.as
    import mx.effects.EffectInstance;
    import flash.media.Sound;
    import flash.media.SoundChannel;
    import flash.net.URLRequest;

    public class MySoundParamInstance extends EffectInstance
    {

        // Define local variables. 
        private var s:Sound;
        private var sndChannel:SoundChannel;
        private var u:URLRequest;

        // Define a variable for the MP3 URL.
        public var soundMP3:String;

        // Define constructor.
        public function MySoundParamInstance(targetObj:Object) {
            super(targetObj);
        }

        // Override play() method.
        override public function play():void     {
            // You must call super.play() from within your override.
            super.play();
            s = new Sound();
            // Use the new parameter to specify the URL.
            u = new URLRequest(soundMP3);
            s.load(u);
            sndChannel=s.play();
        }
    
        // Override end() method to stop the MP3.
        override public function end():void  {
            sndChannel.stop();
            super.end();
        }
    }
}