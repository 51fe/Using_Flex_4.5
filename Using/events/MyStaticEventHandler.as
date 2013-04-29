// events/MyStaticEventHandler.as

package { // Empty package.

    import flash.events.Event;
    import mx.controls.Alert;

    public class MyStaticEventHandler {
        public function MyStaticEventHandler() {
            // Empty constructor.
        }

        public static function handleAllEvents(event:Event):void {
            Alert.show("Some event happened.");
        }
    }
}