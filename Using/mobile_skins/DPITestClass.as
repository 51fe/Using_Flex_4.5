package {
import flash.system.Capabilities;
import mx.core.DPIClassification;
import mx.core.RuntimeDPIProvider;

public class DPITestClass extends RuntimeDPIProvider {
    public function DPITestClass() {
    }
    
    override public function get runtimeDPI():Number {
        // Arbitrary mapping for Mac OS.
        if (Capabilities.os == "Mac OS 10.6.5")
            return DPIClassification.DPI_320;
        
        if (Capabilities.screenDPI < 200)
            return DPIClassification.DPI_160;
        
        if (Capabilities.screenDPI <= 280)
            return DPIClassification.DPI_240;
        
        return DPIClassification.DPI_320; 
    }
}
}