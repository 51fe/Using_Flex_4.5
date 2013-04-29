package myComponents
{

    import flash.display.*;
    import flash.text.*;
    import flash.utils.*;
    import flash.events.*;
    import mx.preloaders.*;
    import mx.events.*;

    public class MyDownloadProgressBar extends DownloadProgressBar
    {
        // Define a TextField control for text messages 
        // describing the download progress of the application.
        private var progressText:TextField;
        
        // Define a TextField control for the final text message.
        // after the application initializes.
        private var msgText:TextField;
    
        public function MyDownloadProgressBar()
        {   
            super();

            // Configure the TextField for progress messages.
            progressText = new TextField(); 
            progressText.x = 10;    
            progressText.y = 90;
            progressText.width = 400;
            progressText.height = 400;
        
            addChild(progressText);
        
            // Configure the TextField for the final message.
            msgText = new TextField();
            msgText.x = 10;
            msgText.y = 10;
            msgText.width = 400;
            msgText.height = 75;
            
            addChild(msgText);
        }
    
        // Define the event listeners for the preloader events.
        override public function set preloader(preloader:Sprite):void {
            // Listen for the relevant events
            preloader.addEventListener(
                ProgressEvent.PROGRESS, myHandleProgress);   
            preloader.addEventListener(
                Event.COMPLETE, myHandleComplete);

            preloader.addEventListener(
                FlexEvent.INIT_PROGRESS, myHandleInitProgress);
            preloader.addEventListener(
                FlexEvent.INIT_COMPLETE, myHandleInitEnd);
        }
    
        // Event listeners for the ProgressEvent.PROGRESS event.
        private function myHandleProgress(event:ProgressEvent):void {
            progressText.appendText("\n" + "Progress l: " + 
                event.bytesLoaded + " t: " + event.bytesTotal);
        }
    
        // Event listeners for the Event.COMPLETE event.
        private function myHandleComplete(event:Event):void {
            progressText.appendText("\n" + "Completed");
        }
    
        // Event listeners for the FlexEvent.INIT_PROGRESS event.
        private function myHandleInitProgress(event:Event):void {
            progressText.appendText("\n" + "App Init Start");
        }
    
        // Event listeners for the FlexEvent.INIT_COMPLETE event.
        private function myHandleInitEnd(event:Event):void {
            msgText.appendText("\n" + "App Init End");
            
            var timer:Timer = new Timer(2000,1);
            timer.addEventListener(TimerEvent.TIMER, dispatchComplete);
            timer.start();
        }
        
        // Event listener for the Timer to pause long enough to 
        // read the text in the download progress bar.
        private function dispatchComplete(event:TimerEvent):void {
            dispatchEvent(new Event(Event.COMPLETE));
        }
    }
}