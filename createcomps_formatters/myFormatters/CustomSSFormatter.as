package myFormatters
{
    // formatters/myFormatter/CustomSSFormatter.as
    import mx.formatters.Formatter
    import mx.formatters.SwitchSymbolFormatter

    public class CustomSSFormatter extends Formatter 
    {
        // Declare the variable to hold the pattern string.
        public var formatString : String = "###-##-####";

        // Constructor
        public function CustomSSFormatter() {
            // Call base class constructor.
            super();
        }

        // Override format().
        override public function format( value:Object ):String {
            // Validate input string value - must be a 9-digit number.
            // You must explicitly check if the value is a number.
            // The formatter does not do that for you. 
            if( !value  || value.toString().length != 9)
                {   error="Invalid String Length";
                    return ""
                }

            // Validate format string.
            // It must contain 9 number placeholders.
            var numCharCnt:int = 0;
            for( var i:int = 0; i<formatString.length; i++ )
                {
                    if( formatString.charAt(i) == "#" )
                    {   numCharCnt++;
                    }
                }

            if( numCharCnt != 9 )
            {
                error="Invalid Format String";
                return ""
            }

            // If the formatString and value are valid, format the number.
            var dataFormatter:SwitchSymbolFormatter = 
                new SwitchSymbolFormatter();
            return dataFormatter.formatValue( formatString, value );
        }
    }
}