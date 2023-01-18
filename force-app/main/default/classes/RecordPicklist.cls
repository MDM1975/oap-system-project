public class RecordPicklist implements IPicklist {
    // picklistRecords: List of records to be used to create the picklist
    List<SObject> picklistRecords { private get; private set; }
    // keyField: The field on the record that will be used as the key for the picklist
    String keyField { private get; private set;}
    // valueField: The field on the record that will be used as the value for the picklist
    String valueField { private get; private set;}

    /**
     * Constructor
     * @param picklistRecords: List of records to be used to create the picklist
     * @param keyField: The field on the record that will be used as the key for the picklist
     * @param valueField: The field on the record that will be used as the value for the picklist
     */
    public RecordPicklist(List<SObject> picklistRecords, String keyField, String valueField) {
        this.picklistRecords = picklistRecords;
        this.keyField = keyField;
        this.valueField = valueField;
    }

    /**
     * Creates a picklist from a list of records
     * @return: JSON string of the picklist
     */
    public String createPicklist() {
        return this.generatePicklistJSON();
    }

    /**
     * Generates the JSON string for the picklist
     * @return: JSON string of the picklist
     */
    private String generatePicklistJSON() {
        RecordAdapter picklistRecords = new RecordAdapter(this.picklistRecords, this.keyField, this.valueField);
        return picklistRecords.convertToJSON();
    }
}