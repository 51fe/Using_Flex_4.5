package myComponents
{
    // binding/myComponents/NonBindableObject.as

    // Make no class properties bindable. 
    public class NonBindableObject extends Object {
    
        public function NonBindableObject() {
            super();            
        }
        
        public var stringProp:String = "String property";

        public var intProp:int = 52;
    }
}