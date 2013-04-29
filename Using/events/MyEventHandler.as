// events/MyEventHandler.as

package { // Empty package.

    import flash.events.Event;
    import mx.controls.Alert;

    public class MyEventHandler {
        public function MyEventHandler() {
            // Empty constructor.
        }

        public function handleAllEvents(event:Event):void {
            Alert.show("Some event happened.");
        }
    }
}