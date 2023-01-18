public interface ITriggerOperation {
    void setOperationContext(TriggerContext context);
    void execute();
}