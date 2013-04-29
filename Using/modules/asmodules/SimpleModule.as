// modules/asmodules/SimpleModule.as
package {
    import mx.modules.ModuleBase;

    public class SimpleModule extends ModuleBase {
        public function SimpleModule() {
            trace("SimpleModule created");
        }
    
        public function computeAnswer(a:Number, b:Number):Number {
            return a + b;
        }
    }
}