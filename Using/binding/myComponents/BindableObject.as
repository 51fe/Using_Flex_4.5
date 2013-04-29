package myComponents
{
    // binding/myComponents/BindableObject.as

    // Make all class properties bindable. 
    [Bindable]
    public class BindableObject extends Object {
    
        public function BindableObject() {
            super();
        }
        
        public var stringProp:String = "String property";

        public var intProp:int = 52;
    }
}