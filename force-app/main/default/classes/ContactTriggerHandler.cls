public class ContactTriggerHandler extends TriggerHandler {
    /** 
    * Constructor
    * @param triggerContext TriggerContext
    */
    public ContactTriggerHandler(TriggerContext triggerContext) {
        // Call the super class constructor
        super(triggerContext);
    }

    /**
    * Public method to execute the trigger handler logic before an insert
    * @return void
    */
    public override void handleBeforeInsert(){
        // Create a new personal account for the contact
        PersonalAccountCreator personalAccountCreator = new PersonalAccountCreator();
        personalAccountCreator.setOperationContext(this.triggerContext);
        personalAccountCreator.execute();
    }
}