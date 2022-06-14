//Class to tackle Task 6 of Mission 6
//Team JAMM

public class TaskSixMission 
{

    public static void updateEnrolProg()
    {
        //Gather the Students with Prior Qualificationa and Enrolment Progress
        List<Contact> conList = [SELECT LastName, Prior_Qualification__c, Enrolment_Progression__c FROM Contact];
        
        //Create a new List to store all the update Student information
        List<Contact> contactToUpdate = new List<Contact>();
        
        //Run the loop to check Students and update Enrolment Progression if conditions are met
        for(Contact updateContact : conList)
        {
            if(updateContact.Prior_Qualification__c == 'Below Tertiary')
            {
                updateContact.Enrolment_Progression__c = 'Advanced';
                contactToUpdate.add(updateContact);
            }
             if(updateContact.Prior_Qualification__c == 'Tertiary Graduate')
            {
                updateContact.Enrolment_Progression__c = 'Ultimate';
                contactToUpdate.add(updateContact);
            }
             if(updateContact.Prior_Qualification__c == 'Tertiary Post-Graduate')
            {
                updateContact.Enrolment_Progression__c = 'Extra';
                contactToUpdate.add(updateContact);
            }
        }
        update contactToUpdate; //Update Student records
        System.debug('The following Students have been updated: ' + contactToUpdate);
    }
}