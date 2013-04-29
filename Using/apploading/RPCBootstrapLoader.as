package {

import flash.display.Loader;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.net.URLRequest;
import flash.system.ApplicationDomain;

/**
 *  Classes used by the networking protocols go here. These are the classes
 *  whose definitions are added to the bootstrap loader and then shared
 *  by the main application and all sub-applications.
 */
import mx.messaging.config.ConfigMap; ConfigMap;
import mx.messaging.messages.AcknowledgeMessage; AcknowledgeMessage;
import mx.messaging.messages.AcknowledgeMessageExt; AcknowledgeMessageExt;
import mx.messaging.messages.AsyncMessage; AsyncMessage;
import mx.messaging.messages.AsyncMessageExt; AsyncMessageExt;
import mx.messaging.messages.CommandMessage; CommandMessage;
import mx.messaging.messages.CommandMessageExt; CommandMessageExt;
import mx.messaging.messages.ErrorMessage; ErrorMessage;
import mx.messaging.messages.HTTPRequestMessage; HTTPRequestMessage;
import mx.messaging.messages.MessagePerformanceInfo; MessagePerformanceInfo;
import mx.messaging.messages.RemotingMessage; RemotingMessage;
import mx.messaging.messages.SOAPMessage; SOAPMessage;
import mx.messaging.channels.HTTPChannel; HTTPChannel;
import mx.core.mx_internal;

[SWF(width="600", height="700")]
public class RPCBootstrapLoader extends Sprite {
        /**
         *  The URL of the application SWF that this bootstrap loader loads.
         */
        private static const applicationURL:String = "MainApp.swf";

        /**
         *  Constructor.
         */
        public function RPCBootstrapLoader() {
                super();

                if (ApplicationDomain.currentDomain.hasDefinition("mx.core::UIComponent"))
                        throw new Error("UIComponent should not be in the bootstrap loader.");

                stage.scaleMode = StageScaleMode.NO_SCALE;
                stage.align = StageAlign.TOP_LEFT;

                if (!stage)
                        isStageRoot = false;

                root.loaderInfo.addEventListener(Event.INIT, initHandler);
        }

        /**
         *  The Loader that loads the main application's SWF file.
         */
        private var loader:Loader;

        /**
         *  Whether the bootstrap loader is at the stage root or not.
         *  It is only the stage root if it was the root
         *  of the first SWF file that was loaded by Flash Player.
         *  Otherwise, it could be a top-level application but not stage root
         *  if it was loaded by some other non-Flex shell or is sandboxed.
         */
        private var isStageRoot:Boolean = true;

        /**
         *  Called when the bootstrap loader's SWF file has been loaded.
         *  Starts loading the application SWF specified by the applicationURL property.
         */
        private function initHandler(event:Event):void {
                loader = new Loader();
                addChild(loader);
                loader.load(new URLRequest(applicationURL));
                loader.addEventListener("mx.managers.SystemManager.isBootstrapRoot", 
                        bootstrapRootHandler);
                loader.addEventListener("mx.managers.SystemManager.isStageRoot", 
                        stageRootHandler);

                stage.addEventListener(Event.RESIZE, resizeHandler);
        }

        private function bootstrapRootHandler(event:Event):void {
                // Cancel event to indicate that the message was heard.
                event.preventDefault();
        }

        private function stageRootHandler(event:Event):void {
                // Cancel event to indicate that the message was heard.
                if (!isStageRoot)
                        event.preventDefault();
        }

        private function resizeHandler(event:Event):void {
                loader.width = stage.width;
                loader.height = stage.height;
                Object(loader.content).setActualSize(stage.width, stage.height);
        }
}

}