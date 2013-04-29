package myEvents
{
    //createcomps_events/myEvents/EnableChangeEvent.as
    import flash.events.Event;

    public class EnableChangeEvent extends Event
    {

        // Public constructor.
        public function EnableChangeEvent(type:String, 
            isEnabled:Boolean=false) {
                // Call the constructor of the superclass.
                super(type);
    
                // Set the new property.
                this.isEnabled = isEnabled;
        }

        // Define static constant.
        public static const ENABLE_CHANGE:String = "enableChange";

        // Define a public variable to hold the state of the enable property.
        public var isEnabled:Boolean;

        // Override the inherited clone() method.
        override public function clone():Event {
            return new EnableChangeEvent(type, isEnabled);
        }
    }
}