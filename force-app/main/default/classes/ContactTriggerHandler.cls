public class ContactTriggerHandler extends TriggerHandler {
    public ContactTriggerHandler(TriggerContext triggerContext) {
        super(triggerContext);
    }

    public override void handleBeforeInsert(){
        PersonalAccountCreator personalAccountCreator = new PersonalAccountCreator();
        personalAccountCreator.setOperationContext(this.triggerContext);
        personalAccountCreator.execute();
    }
}