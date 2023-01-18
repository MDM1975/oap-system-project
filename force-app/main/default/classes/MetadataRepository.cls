public class MetadataRepository {
    /**
     * Returns the metadata for the specified object.
     * @param objectApiName The API name of the object.
     * @return The metadata for the specified object.
     */
    public static DescribeSObjectResult getSObjectMetadata(String objectApiName) {
        return Schema.getGlobalDescribe().get(objectApiName).getDescribe();
    }
    
    /**
     * Returns the metadata for the specified field.
     * @param objectApiName The API name of the object.
     * @param fieldApiName The API name of the field.
     * @return The metadata for the specified field.
     */
    public static DescribeFieldResult getFieldMetadata(String objectApiName, String fieldApiName) {
        return Schema.getGlobalDescribe().get(objectApiName).getDescribe().fields.getMap().get(fieldApiName).getDescribe();
    }
}