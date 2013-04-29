package myValidators
{
    import mx.validators.Validator;
    import mx.validators.ValidationResult;


    public class AgeValidator extends Validator {

        // Define Array for the return value of doValidation().
        private var results:Array;

        // Constructor.
        public function AgeValidator() {
            // Call base class constructor. 
            super();
        }
    
        // Define the doValidation() method.
        override protected function doValidation(value:Object):Array {
        
            // Convert value to a Number.
            var inputValue:Number = Number(value);

            // Clear results Array.
            results = [];

            // Call base class doValidation().
            results = super.doValidation(value);        
            // Return if there are errors.
            if (results.length > 0)
                return results;
        
            // Create a variable and initialize it to the current date.
            var currentYear:Date = new Date();
    
            // If input value is not a number, or contains no value, 
            // issue a validation error.
            if (isNaN(inputValue) || !value )
            {
                results.push(new ValidationResult(true, null, "NaN", 
                    "You must enter a year."));
                return results;
            }       

            // If calculated age is less than 18, issue a validation error.
            if ((currentYear.getFullYear() - inputValue) < 18) {
                results.push(new ValidationResult(true, null, "tooYoung", 
                    "You must be 18."));
                return results;
            }
            
            return results;
        }
    }
}