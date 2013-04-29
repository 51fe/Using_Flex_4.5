// styles/MyButton.as -->
package {

    import mx.controls.Button;
    import mx.events.*;
    
    public class MyButton extends Button {
   
        public function MyButton() {
            addEventListener(FlexEvent.INITIALIZE, initializeHandler);
        }

         // Gets called when the component has been initialized
        private function initializeHandler(event:FlexEvent):void {
            styleManager.loadStyleDeclarations("assets/CustomComponentStyles.swf");
            this.styleName = "specialStyle";
        }
    }    
}