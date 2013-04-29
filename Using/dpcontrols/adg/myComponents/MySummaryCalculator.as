package myComponents
{
    // dpcontrols/adg/myComponents/MySummaryCalculator.as
    import mx.collections.ISummaryCalculator;
    import mx.collections.SummaryField2;
    
    public class MySummaryCalculator implements ISummaryCalculator
    {
        public function MySummaryCalculator() {
        }
        
        // Define the summary object.
        protected var summObj:Object = new Object();
        // Define a var to hold the record count.
        protected var count:int;
        
        public function summaryCalculationBegin(field:SummaryField2):Object {
            // Initialize the variables.
            summObj.oddCount = 0;
            count = 1;
            return summObj;
        }
        
        public function calculateSummary(data:Object, field:SummaryField2, rowData:Object):void {
            // Only add the current value for every other row.
            if (count % 2 != 0)
            {                
                summObj.oddCount = summObj.oddCount + rowData[field.dataField];
                count++;
            }
        }
        
        public function returnSummary(data:Object, field:SummaryField2):Number {
            // Return the summary value.
            return summObj.oddCount;
        }
        
        // Implement these methods if you are creating a summary of summaries.
        public function summaryOfSummaryCalculationBegin(value:Object, field:SummaryField2):Object {
            return null;
        }
        
        public function calculateSummaryOfSummary(value:Object, newValue:Object, field:SummaryField2):void {
        }
        
        public function returnSummaryOfSummary(value:Object, field:SummaryField2):Number {
            return 0;
        }
    }
}