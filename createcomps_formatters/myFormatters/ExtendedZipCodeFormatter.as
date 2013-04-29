package myFormatters
{
    // formatters/myFormatter/ExtendedZipCodeFormatter.as
    import mx.formatters.Formatter
    import mx.formatters.ZipCodeFormatter
    import mx.formatters.SwitchSymbolFormatter

    public class ExtendedZipCodeFormatter extends ZipCodeFormatter {

        // Constructor
        public function ExtendedZipCodeFormatter() {
            // Call base class constructor. 
            super();
            // Initialize formatString.
            formatString = "#####*####";
        }

        // Override format().
        override public function format(value:Object):String {
            // 1. If the formatString is our new pattern, 
            // then validate and format it.

            if( formatString == "#####*####" ){

                if( String( value ).length == 5 )
                    value = String( value ).concat("0000");

                if( String( value ).length == 9 ){
                    var dataFormatter:SwitchSymbolFormatter = 
                        new SwitchSymbolFormatter();
                    return dataFormatter.formatValue( formatString, value );
                }
                else {
                    error="Invalid String Length";
                    return ""
                    }
                }

            // If the formatString is anything other than '#####*####, 
            // call super and validate and format as usual using 
            // the base ZipCodeFormatter.
            return super.format(value);
        }
    }   
}