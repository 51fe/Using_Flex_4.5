package myComponents
{
    // binding/myComponents/OuterBindableObject.as

    // Make all class properties bindable. 
    [Bindable]
    public class OuterBindableObject extends Object {
    
        public function OuterBindableObject() {
            super();
        }
        
        // BindableObject has two properties, stringProp and intProp.
        public var bindableObjProp:BindableObject = new BindableObject();
    }
}