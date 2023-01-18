public class PicklistFactory {
    /**
     * This method creates a picklist based on the values in the Course Prefix field
     * @return String JSON
     */
    public String newCoursePrefixPicklist() {
        MetadataPicklist picklist = new MetadataPicklist('Course__c', 'Course_Prefix__c');
        return picklist.createPicklist();
    }

    /**
     * This method creates a picklist based on the values in the enrollment status field
     * @return String JSON
     */
    public String newEnrollmentStatusPicklist() {
        MetadataPicklist picklist = new MetadataPicklist('Program_Enrollment__c', 'Enrollment_Status__c');
        return picklist.createPicklist();
    }

    /**
     * This method creates a picklist based on the values in the academic standing field
     * @return String JSON
     */
    public String newAcademicStandingPicklist() {
        MetadataPicklist picklist = new MetadataPicklist('Program_Enrollment__c', 'Academic_Standing__c');
        return picklist.createPicklist();
    }

    /**
     * This method creates a picklist based on course records
     * @return String JSON
     */
    public String newCoursePicklist() {
        List<Course__c> courses = [SELECT Id, Course_Name__c FROM Course__c LIMIT 5];
        return new RecordPicklist(courses, 'Id', 'Course_Name__c').createPicklist();
    }

    /**
     * This method creates a picklist based on program records
     * @return String JSON
     */
    public String newProgramPicklist() {
        List<Program__c> programs = [SELECT Id, Program_Name__c FROM Program__c LIMIT 5];
        return new RecordPicklist(programs, 'Id', 'Program_Name__c').createPicklist();
    }
}