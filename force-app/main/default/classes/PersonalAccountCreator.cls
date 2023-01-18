public class PersonalAccountCreator implements ITriggerOperation {
    // The new contacts in the trigger context needed to create the personal accounts
    public List<Contact> newContacts { get; private set; }
    // The personal accounts that are created
    public Map<Contact, Account> personalAccounts { get; private set; }

    /**
     * Constructor
     */
    public PersonalAccountCreator() {
        this.personalAccounts = new Map<Contact, Account>();
    }

    /**
     * Sets the operation context
     * @param context The trigger context
     * @return void
     */
    public void setOperationContext(TriggerContext context) {
        this.newContacts = context.newRecords;
    }

    /**
     * Executes the operation
     * @return void
     */
    public void execute() {
        this.buildPersonalAccounts();
        this.savePersonalAccount();
        this.updateContact();
    }

    /**
     * Builds the personal accounts
     * @return void
     */
    private void buildPersonalAccounts() {
        for(Contact contact : this.newContacts) {
            PersonalAccountBuilder personalAccount = new PersonalAccountBuilder();
            personalAccount.setAccountName(contact.FirstName, contact.LastName);
            this.personalAccounts.put(contact, personalAccount.build());
        }
    }

    /**
     * Saves the personal accounts
     * @return void
     */
    private void savePersonalAccount() {
        insert personalAccounts.values();
    }

    /**
     * Updates the contacts with the new account id
     * @return void
     */
    private void updateContact() {
        for(Contact contact : this.newContacts) {
            contact.AccountId = this.personalAccounts.get(contact).Id;
        }
    }
}