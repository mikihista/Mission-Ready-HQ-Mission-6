@isTest

//A class to test TaskSixMission Apex program
//Team JAMM

private class TaskSixMissionTest 
{

    public static testmethod void testAdvanced()
    {
        Contact testContact1 = new Contact();
        testContact1.FirstName = 'Sponge';
        testContact1.LastName = 'Bob';
        testContact1.Prior_Qualification__c = 'Below Tertiary';
        insert testContact1;
        
        TaskSixMission.updateEnrolProg();
        
        Contact contactTesting1 = [SELECT Id, Prior_Qualification__c, Enrolment_Progression__c FROM Contact WHERE FirstName = 'Sponge'];
        System.assertEquals('Advanced', contactTesting1.Enrolment_Progression__c);
    }
    
    public static testmethod void testUltimate()
    {
        
        Contact testContact2 = new Contact();
        testContact2.FirstName = 'Peter';
        testContact2.LastName = 'Parker';
        testContact2.Prior_Qualification__c = 'Tertiary Graduate';
        insert testContact2;
        
        TaskSixMission.updateEnrolProg();
        
        Contact contactTesting2 = [SELECT Id, Prior_Qualification__c, Enrolment_Progression__c FROM Contact WHERE FirstName = 'Peter'];
        System.assertEquals('Ultimate', contactTesting2.Enrolment_Progression__c);
      
    }
    
    public static testmethod void testExtra()
    {
        
        Contact testContact3 = new Contact();
        testContact3.FirstName = 'Stephen';
        testContact3.LastName = 'Strange';
        testContact3.Prior_Qualification__c = 'Tertiary Post-Graduate';
        insert testContact3;
        
        TaskSixMission.updateEnrolProg();
        
        Contact contactTesting3 = [SELECT Id, Prior_Qualification__c, Enrolment_Progression__c FROM Contact WHERE FirstName = 'Stephen'];
        System.assertEquals('Extra', contactTesting3.Enrolment_Progression__c);
        
    }
}