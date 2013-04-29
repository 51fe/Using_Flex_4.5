package myValidators
{
    import mx.validators.Validator;
    import mx.validators.ValidationResult;

    public class NameValidator extends Validator {

        // Define Array for the return value of doValidation().
        private var results:Array;

        public function NameValidator () {
            super();
        }

        override protected function doValidation(value:Object):Array {
        
            var fName:String = value.first;
            var mName:String = value.middle;
            var lName:String = value.last;  
            
            // Clear results Array.
            results = [];

            // Call base class doValidation().
            results = super.doValidation(value);        
            // Return if there are errors.
            if (results.length > 0)
                return results;

            // Check first name field. 
            if (fName == "" || fName == null) {
                results.push(new ValidationResult(true, 
                    "first", "noFirstName", "No First Name."));
                return results;
            }
            
            // Check middle name field.             
            if (mName == "" || mName == null) {
                results.push(new ValidationResult(true, 
                    "middle", "noMiddleName", "No Middle Name."));
                return results;
            }

            // Check last name field. 
            if (lName == "" || lName == null) {
                results.push(new ValidationResult(true, 
                    "last", "noLastName", "No Last Name."));
                return results;
            }
            
            return results;
        }
    }
}