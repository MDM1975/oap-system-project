public class PicklistFactory {
    public String newCoursePrefixPicklist() {
        MetadataPicklist picklist = new MetadataPicklist('Course__c', 'Course_Prefix__c');
        return picklist.createPicklist();
    }

    public String newEnrollmentStatusPicklist() {
        MetadataPicklist picklist = new MetadataPicklist('Program_Enrollment__c', 'Enrollment_Status__c');
        return picklist.createPicklist();
    }

    public String newAcademicStandingPicklist() {
        MetadataPicklist picklist = new MetadataPicklist('Program_Enrollment__c', 'Academic_Standing__c');
        return picklist.createPicklist();
    }

    public String newCoursePicklist() {
        List<Course__c> courses = [SELECT Id, Course_Name__c FROM Course__c LIMIT 5];
        return new RecordPicklist(courses, 'Id', 'Course_Name__c').createPicklist();
    }

    public String newProgramPicklist() {
        List<Program__c> programs = [SELECT Id, Program_Name__c FROM Program__c LIMIT 5];
        return new RecordPicklist(programs, 'Id', 'Program_Name__c').createPicklist();
    }
}