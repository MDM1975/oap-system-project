public virtual class TriggerHandler {
    protected TriggerContext triggerContext { get; private set; }

    protected TriggerHandler(TriggerContext triggerContext) {
        this.triggerContext = triggerContext;
    }

    public void handle() {
        switch on (triggerContext.operationType) {
            when 'BEFORE_INSERT' { this.handleBeforeInsert(); }
            when 'AFTER_INSERT' { this.handleAfterInsert(); }
            when 'BEFORE_UPDATE' { this.handleBeforeUpdate(); }
            when 'AFTER_UPDATE' { this.handleAfterUpdate(); }
        }
    }

    protected virtual void handleBeforeInsert(){}
    protected virtual void handleAfterInsert(){}
    protected virtual void handleBeforeUpdate(){}
    protected virtual void handleAfterUpdate(){}
}