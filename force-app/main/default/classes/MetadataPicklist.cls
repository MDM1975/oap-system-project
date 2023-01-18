public class MetadataPicklist implements IPicklist {
    public String objectApiName { private get; private set; }
    public String fieldApiName { private get; private set; }
    public List<PicklistEntry> picklistEntries { private get; private set; }

    public MetadataPicklist(String objectApiName, String fieldApiName) {
        this.objectApiName = objectApiName;
        this.fieldApiName = fieldApiName;
        this.picklistEntries = this.setPicklistEntries();
    }

    public String createPicklist() {
        return this.generatePicklistJSON();
    }

    private List<PicklistEntry> setPicklistEntries() {
        DescribeFieldResult fieldMetadata = MetadataRepository.getFieldMetadata(this.objectApiName, this.fieldApiName);
        return fieldMetadata.getPicklistValues();
    }

    private String generatePicklistJSON() {
        MetadataAdapter picklistMetadata = new MetadataAdapter(this.picklistEntries);
        return picklistMetadata.convertToJSON();
    }
}