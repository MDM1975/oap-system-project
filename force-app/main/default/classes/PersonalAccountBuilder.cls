public class PersonalAccountBuilder implements IRecordBuilder {
    // Account record for the personal account
    public Account personalAccount { get; private set; }
    // Name of the personal account
    public String personalAccountName { get; private set; }
    // Record Type Id of the personal account
    public final Id personalAccountRecordTypeId = Record_Type__mdt.getInstance('Personal_Account').Id__c;

    /**
     * Constructor
     */
    public PersonalAccountBuilder() {
        this.personalAccount = new Account();
    }

    /**
     * Sets the name of the personal account
     * @param firstName First name of the account owner
     * @param lastName Last name of the account owner
     * @return PersonalAccountBuilder
     */
    public PersonalAccountBuilder setAccountName(String firstName, String lastName) {
        this.personalAccountName = String.format('{0} {1}\'s Personal Account', new List<String>{firstName, lastName});
        return this;
    }

    /**
     * Sets the name of the personal account
     * @param name Name of the personal account
     * @return Account
     */
    public Account build(){
        personalAccount.Name = this.personalAccountName;
        personalAccount.RecordTypeId = this.personalAccountRecordTypeId;
        return personalAccount;
    }
}