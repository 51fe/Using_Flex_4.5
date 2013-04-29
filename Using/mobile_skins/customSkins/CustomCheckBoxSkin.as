// mobile_skins/customSkins/CustomCheckBoxSkin.as 
package customSkins {   
    import spark.skins.mobile.CheckBoxSkin;
    import customSkins.assets.CustomCheckBox_upSymbol; 
    
    public class CustomCheckBoxSkin extends CheckBoxSkin { 
        public function CustomCheckBoxSkin() { 
            super(); 
            upSymbolIconClass = CustomCheckBox_upSymbol; // was CheckBox_upSymbol 
        } 
    } 
}