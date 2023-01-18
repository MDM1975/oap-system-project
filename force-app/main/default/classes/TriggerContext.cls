public class TriggerContext {
    // The operation type of the trigger context
    public String operationType { get; private set; }
    // The new records of the trigger context
    public List<SObject> newRecords { get; private set; }
    // The old records of the trigger context
    public List<SObject> oldRecords { get; private set; }

    /**
     * Constructor
     * @param operationType The operation type of the trigger context
     * @param newRecords The new records of the trigger context
     * @param oldRecords The old records of the trigger context
     */
    public TriggerContext(String operationType, List<SObject> newRecords, List<SObject> oldRecords) {
        this.operationType = operationType;
        this.newRecords = newRecords;
        this.oldRecords = oldRecords;
    }
}