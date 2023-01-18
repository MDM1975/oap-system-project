public interface ITriggerOperation {
    /**
     * Set the context for this operation.
     * @param context
     */
    void setOperationContext(TriggerContext context);

    /**
     * Execute the operation.
     */
    void execute();
}