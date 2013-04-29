package myFormatters
{
    // formatters/myFormatter/SimpleFormatter.as
    import mx.formatters.Formatter
    import mx.formatters.SwitchSymbolFormatter

    public class SimpleFormatter extends Formatter 
    {
        // Declare the variable to hold the pattern string.
        public var myFormatString:String = "upper";

        // Constructor
        public function SimpleFormatter() {
            // Call base class constructor.
            super();
        }

        // Override format().
        override public function format(value:Object):String {
            // 1. Validate value - must be a nonzero length string.
            if( value.length == 0)
                {   error="0 Length String";
                    return ""
                }

            // 2. If the value is valid, format the string.
            switch (myFormatString) {
                case "upper" :
                    var upperString:String = value.toUpperCase();
                    return upperString;
                    break;
                case "lower" :
                    var lowerString:String = value.toLowerCase();
                    return lowerString; 
                    break;
                default :   
                    error="Invalid Format String";
                    return ""
            }
        }
    }
}