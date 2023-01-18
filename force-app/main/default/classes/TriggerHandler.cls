public virtual class TriggerHandler {
    // TriggerContext is a wrapper class for the trigger context
    protected TriggerContext triggerContext { get; private set; }

    /**
     * Constructor
     * @param triggerContext The trigger context
     */
    protected TriggerHandler(TriggerContext triggerContext) {
        this.triggerContext = triggerContext;
    }

    /**
     * Handles the trigger based on the operation type
     * @return void
     */
    public void handle() {
        switch on (triggerContext.operationType) {
            when 'BEFORE_INSERT' { this.handleBeforeInsert(); }
            when 'AFTER_INSERT' { this.handleAfterInsert(); }
            when 'BEFORE_UPDATE' { this.handleBeforeUpdate(); }
            when 'AFTER_UPDATE' { this.handleAfterUpdate(); }
        }
    }

    //-----Context methods to be overridden by the concrete subclasses of TriggerHandler-----
    
    /**
     * Handles the trigger before the insert operation
     * @return void
     */
    protected virtual void handleBeforeInsert(){}

    /**
     * Handles the trigger after the insert operation
     * @return void
     */
    protected virtual void handleAfterInsert(){}

    /**
     * Handles the trigger before the update operation
     * @return void
     */
    protected virtual void handleBeforeUpdate(){}

    /**
     * Handles the trigger after the update operation
     * @return void
     */
    protected virtual void handleAfterUpdate(){}
}