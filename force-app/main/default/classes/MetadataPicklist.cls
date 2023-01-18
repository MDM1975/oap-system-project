public class MetadataPicklist implements IPicklist {
    // objectApiName and fieldApiName are required to get the picklist values
    public String objectApiName { private get; private set; }
    public String fieldApiName { private get; private set; }
    public List<PicklistEntry> picklistEntries { private get; private set; }

    /**
     * Constructor
     * @param objectApiName The API name of the object
     * @param fieldApiName The API name of the field
    */
    public MetadataPicklist(String objectApiName, String fieldApiName) {
        this.objectApiName = objectApiName;
        this.fieldApiName = fieldApiName;
        this.picklistEntries = this.setPicklistEntries();
    }

    /**
     * Method to create the picklist JSON
     * @return String JSON
    */
    public String createPicklist() {
        return this.generatePicklistJSON();
    }

    /**
     * Method to get the picklist entries
     * @return String JSON
    */
    private List<PicklistEntry> setPicklistEntries() {
        DescribeFieldResult fieldMetadata = MetadataRepository.getFieldMetadata(this.objectApiName, this.fieldApiName);
        return fieldMetadata.getPicklistValues();
    }

    /**
     * Method to generate the picklist JSON
     * @return String
    */
    private String generatePicklistJSON() {
        MetadataAdapter picklistMetadata = new MetadataAdapter(this.picklistEntries);
        return picklistMetadata.convertToJSON();
    }
}