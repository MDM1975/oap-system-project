public class MetadataRepository {
    public static DescribeSObjectResult getSObjectMetadata(String objectApiName) {
        return Schema.getGlobalDescribe().get(objectApiName).getDescribe();
    }
    
    public static DescribeFieldResult getFieldMetadata(String objectApiName, String fieldApiName) {
        return Schema.getGlobalDescribe().get(objectApiName).getDescribe().fields.getMap().get(fieldApiName).getDescribe();
    }
}