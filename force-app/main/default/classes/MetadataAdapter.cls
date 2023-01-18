public class MetadataAdapter implements IJSONAdapter {
    public List<PicklistEntry> picklistEntries { private get; private set; }

    public MetadataAdapter(List<PicklistEntry> picklistEntries) {
        this.picklistEntries = picklistEntries;
    }

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