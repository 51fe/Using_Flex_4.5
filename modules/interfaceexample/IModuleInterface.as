// modules/interfaceexample/IModuleInterface.as
package
{
    import flash.events.IEventDispatcher;

    public interface IModuleInterface extends IEventDispatcher {
    
        function getModuleName():String;
        function setAdjusterID(s:String):void;
        function setBackgroundColor(n:Number):void;
    }

}