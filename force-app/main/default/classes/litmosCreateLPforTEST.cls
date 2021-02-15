public inherited sharing class litmosCreateLPforTEST {
    // *************    IMPORTANT   ***********
    // Do not use this code in an active Litmos-Salesforce configuration. It is designed to populate TEST DATA in a Sanbox or DEVELOPER ORG ONLY.
    // Using this code in a production environment may have unintended and UNTESTED implications on your existing data
    // There is NO TEST CODE provided for this method because it is not intended for production. It is a single-use code for test data.
    public static void litmosCreateLPforTEST() {
        List<Litmos__LearningPath__c> lp = new List<Litmos__LearningPath__c>();
        //uncomment this section to retrieve info from your org if it's been entered.
        //Litmos__Configuration__c config = [SELECT Litmos__Api_Key__c, Litmos__Api_End_Point__c FROM Litmos__Configuration__c LIMIT 1];
        //String apikey = config.Litmos__Api_Key__c;
        //String endpoint = config.Litmos__Api_End_Point__c + 'learningpaths?source=sourceapp&format=json';

        //replace the apikey here with the apikey Litmos org you wish to pull learning path data from. 
        //feel free to add &limit=XX to pull a limited number of learning paths into Salesforce OR prevent limits from being hit from Litmos. See Overview Developer API from Litmos for information.
        String apikey = 'yourapikey';
        String endpoint='https://api.litmos.com/v1.svc/learningpaths?source=sourceapp&format=json';

        HttpResponse response = litmosConnection.getLitmosExternalService(endpoint, apikey);
        if(response.getStatusCode() == 200) {
        	List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Object o : results) {
                Map<String,Object> obj = (Map<String,Object>)o;
                Litmos__LearningPath__c path = new Litmos__LearningPath__c(
                	Name = String.valueOf(obj.get('Name')).length() > 80 ? String.valueOf(obj.get('Name')).substring(0,79) : String.valueOf(obj.get('Name')),
                    Litmos_Full_Id__c = String.valueOf(obj.get('Id')),
                    Litmos__Active__c = Boolean.valueOf(obj.get('Active')),
                    Litmos__LitmosId__c = String.valueOf(obj.get('OriginalId'))
                );
                lp.add(path);          
            }
        }
        insert lp;
    }
    public static void litmosCreateProgramforTEST() {
        List<Litmos__Program__c> programs = new List<Litmos__Program__c>();
        //uncomment this section to retrieve info from your org if it's been entered.
        //Litmos__Configuration__c config = [SELECT Litmos__Api_Key__c, Litmos__Api_End_Point__c FROM Litmos__Configuration__c LIMIT 1];
        //String apikey = config.Litmos__Api_Key__c;
        //String endpoint = config.Litmos__Api_End_Point__c + 'learningpaths?source=sourceapp&format=json';

        //replace the apikey here with the apikey Litmos org you wish to pull learning path data from. 
        //feel free to add &limit=XX to pull a limited number of learning paths into Salesforce OR prevent limits from being hit. See Overview Developer API from Litmos for information.
        String apikey = 'apikey';
        String endpoint='https://api.litmos.com/v1.svc/courses?source=sourceapp&format=json';
        HttpResponse response = litmosConnection.getLitmosExternalService(endpoint, apikey);
        if(response.getStatusCode() == 200) {
        	List<Object> results = (List<Object>)JSON.deserializeUntyped(response.getBody());
            for(Object o : results) {
                Map<String,Object> obj = (Map<String,Object>)o;
                Litmos__Program__c program = new Litmos__Program__c(
                	Name = String.valueOf(obj.get('Name')).length() > 80 ? String.valueOf(obj.get('Name')).substring(0,79) : String.valueOf(obj.get('Name')),
                    Litmos_Full_Id__c = String.valueOf(obj.get('Id')),
                    Litmos__Active__c = Boolean.valueOf(obj.get('Active')),
                    Litmos__LitmosId__c = String.valueOf(obj.get('OriginalId'))
                );
                programs.add(program);          
            }
        }
        insert programs;
    }
}