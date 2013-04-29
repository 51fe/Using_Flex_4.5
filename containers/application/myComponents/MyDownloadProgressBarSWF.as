package myComponents
{
    import flash.display.*;
    import flash.utils.*;
    import flash.events.*;
    import flash.net.*;
    import mx.preloaders.*; 
    import mx.events.*;
    
    public class MyDownloadProgressBarSWF extends Sprite 
        implements IPreloaderDisplay
    {
        // Define a Loader control to load the SWF file.
        private var dpbImageControl:flash.display.Loader;
    
        public function MyDownloadProgressBarSWF() {   
            super();        
        }
        
        // Specify the event listeners.
        public function set preloader(preloader:Sprite):void {
            // Listen for the relevant events
            preloader.addEventListener(
                ProgressEvent.PROGRESS, handleProgress); 
            preloader.addEventListener(
                Event.COMPLETE, handleComplete);
    
            preloader.addEventListener(
                FlexEvent.INIT_PROGRESS, handleInitProgress);
            preloader.addEventListener(
                FlexEvent.INIT_COMPLETE, handleInitComplete);
        }
        
        // Initialize the Loader control in the override 
        // of IPreloaderDisplay.initialize().
        public function initialize():void {
            dpbImageControl = new flash.display.Loader();       
            dpbImageControl.contentLoaderInfo.addEventListener(
                Event.COMPLETE, loader_completeHandler);
            dpbImageControl.load(new URLRequest("assets/dpbSWF.swf"));         
        }

        // After the SWF file loads, set the size of the Loader control.
        private function loader_completeHandler(event:Event):void
        {
            addChild(dpbImageControl);
            dpbImageControl.width = 50;
            dpbImageControl.height= 50;
            dpbImageControl.x = 100;
            dpbImageControl.y = 100;
        }   
        
        // Define empty event listeners.
        private function handleProgress(event:ProgressEvent):void {
        }
        
        private function handleComplete(event:Event):void {
        }
        
        private function handleInitProgress(event:Event):void {
        }
        
        private function handleInitComplete(event:Event):void {
            var timer:Timer = new Timer(2000,1);
            timer.addEventListener(TimerEvent.TIMER, dispatchComplete);
            timer.start();      
        }
    
        private function dispatchComplete(event:TimerEvent):void {
            dispatchEvent(new Event(Event.COMPLETE));
        }

        // Implement IPreloaderDisplay interface
    
        public function get backgroundColor():uint {
            return 0;
        }
        
        public function set backgroundColor(value:uint):void {
        }
        
        public function get backgroundAlpha():Number {
            return 0;
        }
        
        public function set backgroundAlpha(value:Number):void {
        }
        
        public function get backgroundImage():Object {
            return undefined;
        }
        
        public function set backgroundImage(value:Object):void {
        }
        
        public function get backgroundSize():String {
            return "";
        }
        
        public function set backgroundSize(value:String):void {
        }
    
        public function get stageWidth():Number {
            return 200;
        }
        
        public function set stageWidth(value:Number):void {
        }
        
        public function get stageHeight():Number {
            return 200;
        }
        
        public function set stageHeight(value:Number):void {
        }
    }
}