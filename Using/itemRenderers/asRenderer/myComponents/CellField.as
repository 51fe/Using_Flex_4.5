package myComponents {
    // myComponents/CellField.as
    import mx.controls.*;
    import mx.controls.dataGridClasses.DataGridListData;
    import mx.core.*;

    public class CellField extends TextInput
    {
        // Get the initial background color.
        public var tempBGColor:Number;
        
        // Define the constructor and set properties.
        public function CellField() {
            super();
            height=60;
            width=80;
            tempBGColor = getStyle("contentBackgroundColor");
            editable=false;
        }

        // Override the set method for the data property.
        override public function set data(value:Object):void {
            super.data = value;
            // Since the item renderer can be recycled, 
            // set the initial background color.
            setStyle("contentBackgroundColor", tempBGColor);
       
            if (value != null)
            {
                text = value[DataGridListData(listData).dataField];
                if(Number(text) > 100)
                {
                    setStyle("contentBackgroundColor", 0xFF0000);
                }
                else
                {
                    setStyle("contentBackgroundColor", 0xFFFFFF);
                }
            }

            else
            {
                // If value is null, clear text.
                text= "";
            }

            super.invalidateDisplayList();
        }
    }
}