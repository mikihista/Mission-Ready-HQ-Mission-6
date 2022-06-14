//Apex Trigger to tackle Task 9 in Mission 6
//Team JAMM

trigger TaskNineMission on Contact (after insert) 
{

    if(Trigger.isInsert)
    {
        
        List<Enrolment__c> enrolToInsert = new List<Enrolment__c>();
  
        for(Contact newStud : Trigger.new)
        {
            Enrolment__c newEnrol = new Enrolment__c(); //Instantiate the object to put values for future record
            newEnrol.Student_del__c = newStud.Id; //Grabbing the Record ID of the new Student to be added in the enrolment
            newEnrol.Course_del__c = 'a005h00000MOKV8AAP'; // Hardcoding the correct course
            enrolToInsert.add(newEnrol); //Adding all the info to the List
        }
        
        insert enrolToInsert; //Inserting the record in SF
    }
}