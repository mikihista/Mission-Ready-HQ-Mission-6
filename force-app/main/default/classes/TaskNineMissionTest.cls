@isTest

//A class to test TaskNineMission Apex program
//Team JAMM

private class TaskNineMissionTest 
{

    @isTest static void testEnrolToInsert()
    {
        Test.startTest();
        //Testing Trigger by creating a new Student, and then the student should be added in a new Enrolment
        Contact newStud = new Contact
            (
        		FirstName = 'Sponge',
                Lastname = 'Bob',
                Prior_Qualification__c = 'Below Tertiary',
                Enrolment_Progression__c = 'Advanced'
        	);
        insert newStud; //insert the record in this test unit
        
        //Gather the necessary information to be used for testing
        List<Enrolment__c> enrolList = [SELECT Id, Name, Course_del__c, Student_del__c FROM Enrolment__c];
        System.assertEquals(newStud.Id, enrolList[0].Student_del__c); //Student ID from the created Student record
        System.assertEquals('a005h00000MOKV8AAP', enrolList[0].Course_del__c); //Hard coded the ID Since that's the only course we needed
        Test.stopTest();
    }
}