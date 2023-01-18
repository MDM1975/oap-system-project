public class RecordAdapter implements IJSONAdapter {
    public List<SObject> records { private get; private set; }
    public String keyField { private get; private set; }
    public String valueField { private get; private set; }

    public RecordAdapter(List<SObject> records, String keyField, String valueField) {
        this.records = records;
        this.keyField = keyField;
        this.valueField = valueField;
    }

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