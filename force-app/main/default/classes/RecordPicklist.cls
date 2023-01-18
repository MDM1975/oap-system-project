public class RecordPicklist implements IPicklist {
    List<SObject> picklistRecords { private get; private set; }
    String keyField { private get; private set;}
    String valueField { private get; private set;}

    public RecordPicklist(List<SObject> picklistRecords, String keyField, String valueField) {
        this.picklistRecords = picklistRecords;
        this.keyField = keyField;
        this.valueField = valueField;
    }

    public String createPicklist() {
        return this.generatePicklistJSON();
    }

    private String generatePicklistJSON() {
        RecordAdapter picklistRecords = new RecordAdapter(this.picklistRecords, this.keyField, this.valueField);
        return picklistRecords.convertToJSON();
    }
}