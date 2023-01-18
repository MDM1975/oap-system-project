public class PersonalAccountBuilder implements IRecordBuilder {
    public Account personalAccount { get; private set; }
    public String personalAccountName { get; private set; }
    public final Id personalAccountRecordTypeId = Record_Type__mdt.getInstance('Personal_Account').Id__c;

    public PersonalAccountBuilder() {
        this.personalAccount = new Account();
    }

    public PersonalAccountBuilder setAccountName(String firstName, String lastName) {
        this.personalAccountName = String.format('{0} {1}\'s Personal Account', new List<String>{firstName, lastName});
        return this;
    }

    public Account build(){
        personalAccount.Name = this.personalAccountName;
        personalAccount.RecordTypeId = this.personalAccountRecordTypeId;
        return personalAccount;
    }
}