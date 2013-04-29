package
{
    // dragdrop/Car.as
    
    [RemoteClass]
    public class Car extends Object
    {
        // Constructor.
        public function Car()
        {
            super();
        }
        
        // Class properties.
        public var numWheels:int;
        public var model:String;
        public var make:String;
        
        public function get label():String
        {
            return make + " " + model;
        }        
    }
}