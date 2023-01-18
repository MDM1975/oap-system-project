public class MetadataAdapter implements IJSONAdapter {
    // The picklist entries to convert to JSON
    public List<PicklistEntry> picklistEntries { private get; private set; }

    /**
    * Constructor
    * @param picklistEntries The picklist entries to convert to JSON
    */
    public MetadataAdapter(List<PicklistEntry> picklistEntries) {
        this.picklistEntries = picklistEntries;
    }

    /**
    * Converts the picklist entries to JSON
    * @return String The JSON representation of the picklist entries
    */
    public String convertToJSON() {
        List<Map<String, String>> picklistJSON = new List<Map<String, String>>();
        for(PicklistEntry picklistValue : this.picklistEntries) {
            Map<String, String> picklistMap = new Map<String, String>{ 
                'value' => picklistValue.getValue(),
                'label' => picklistValue.getValue()
            };

            picklistJSON.add(picklistMap);
        }

        return JSON.serialize(picklistJSON);
    }
}