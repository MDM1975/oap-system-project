public class PersonalAccountCreator implements ITriggerOperation {
    public List<Contact> newContacts { get; private set; }
    public Map<Contact, Account> personalAccounts { get; private set; }

    public PersonalAccountCreator() {
        this.personalAccounts = new Map<Contact, Account>();
    }

    public void setOperationContext(TriggerContext context) {
        this.newContacts = context.newRecords;
    }

    public void execute() {
        this.buildPersonalAccounts();
        this.savePersonalAccount();
        this.updateContact();
    }

    private void buildPersonalAccounts() {
        for(Contact contact : this.newContacts) {
            PersonalAccountBuilder personalAccount = new PersonalAccountBuilder();
            personalAccount.setAccountName(contact.FirstName, contact.LastName);
            this.personalAccounts.put(contact, personalAccount.build());
        }
    }

    private void savePersonalAccount() {
        insert personalAccounts.values();
    }

    private void updateContact() {
        for(Contact contact : this.newContacts) {
            contact.AccountId = this.personalAccounts.get(contact).Id;
        }
    }
}