package
{
import flash.system.Capabilities;
import mx.core.DPIClassification;
import mx.core.RuntimeDPIProvider;

public class SpecialCaseMapping extends RuntimeDPIProvider {
    public function SpecialCaseMapping() {
    }
    
    override public function get runtimeDPI():Number {
        /* A tablet reporting an incorrect DPI of 240. We could use
            Capabilities.manufacturer to check the tablet's OS as well. */
        if (Capabilities.screenDPI == 240 && 
            Capabilities.screenResolutionY == 1024 && 
            Capabilities.screenResolutionX == 600) {
            return DPIClassification.DPI_160;
        }
        
        if (Capabilities.screenDPI < 200)
            return DPIClassification.DPI_160;
        
        if (Capabilities.screenDPI <= 280)
            return DPIClassification.DPI_240;
        
        return DPIClassification.DPI_320; 
    }
}
}