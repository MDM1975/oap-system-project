public class TriggerContext {
    public String operationType { get; private set; }
    public List<SObject> newRecords { get; private set; }
    public List<SObject> oldRecords { get; private set; }

    public TriggerContext(String operationType, List<SObject> newRecords, List<SObject> oldRecords) {
        this.operationType = operationType;
        this.newRecords = newRecords;
        this.oldRecords = oldRecords;
    }
}