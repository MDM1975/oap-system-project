public class RecordAdapter implements IJSONAdapter {
    // records: List of records to convert to JSON
    public List<SObject> records { private get; private set; }
    // keyField: Field to use as the key in the JSON
    public String keyField { private get; private set; }
    // valueField: Field to use as the value in the JSON
    public String valueField { private get; private set; }

    /**
     * Constructor
     * @param records List of records to convert to JSON
     * @param keyField Field to use as the key in the JSON
     * @param valueField Field to use as the value in the JSON
     */
    public RecordAdapter(List<SObject> records, String keyField, String valueField) {
        this.records = records;
        this.keyField = keyField;
        this.valueField = valueField;
    }

    /**
     * Convert the records to JSON
     * @return JSON string
     */
    public String convertToJSON() {
        List<Map<String, String>> picklistJSON = new List<Map<String, String>>();
        for(SObject picklistValue : records) {
            Map<String, String> picklistMap = new Map<String, String>{
                'value' => (String)picklistValue.get(this.keyField), 
                'label' => (String)picklistValue.get(this.valueField)
            };
    
            picklistJSON.add(picklistMap);
        }
    
        return JSON.serialize(picklistJSON);
    }
}