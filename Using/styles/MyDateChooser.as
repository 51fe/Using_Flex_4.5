// styles/MyDateChooser.as
package {
    import mx.controls.DateChooser;
    
    public class MyDateChooser extends DateChooser {
        private static var myNextMonthStyleFilters:Object = {
             "highlightAlphas" : "highlightAlphas",
             "nextMonthUpSkin" : "nextMonthUpSkin",
             "nextMonthOverSkin" : "nextMonthOverSkin",
             "nextMonthDownSkin" : "nextMonthDownSkin",
             "nextMonthDisabledSkin" : "nextMonthDisabledSkin",
             "nextMonthSkin" : "nextMonthSkin",
             "repeatDelay" : "repeatDelay",
             "repeatInterval" : "repeatInterval",
             "cornerRadius" : "cornerRadius"  // This property is not normally included.
        } 
        
       override protected function get nextMonthStyleFilters():Object {
            return myNextMonthStyleFilters;
       }
           
       private static var myPrevMonthStyleFilters:Object = {
            "highlightAlphas" : "highlightAlphas",
            "prevMonthUpSkin" : "prevMonthUpSkin",
            "prevMonthOverSkin" : "prevMonthOverSkin",
            "prevMonthDownSkin" : "prevMonthDownSkin",
            "prevMonthDisabledSkin" : "prevMonthDisabledSkin",
            "prevMonthSkin" : "prevMonthSkin",
            "repeatDelay" : "repeatDelay",
            "repeatInterval" : "repeatInterval",
            "cornerRadius" : "cornerRadius"
        } 
               
        override protected function get prevMonthStyleFilters():Object {
            return myPrevMonthStyleFilters;
        }           
    }
}