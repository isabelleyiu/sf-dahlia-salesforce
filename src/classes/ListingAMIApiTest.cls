// *****************************************************************************
// CLASS: ListingAMIApiTest
// *****************************************************************************
//
// Author: Vertiba
// Date: 03/08/16
// Description: Test class for ListingAMIApi.cls
//
// *
@isTest
private class ListingAMIApiTest {

	private static List<Properties__c> lProperties;
    private static Account acc;
    private static Contact con;
    private static User usr;
    //private static AMI_Chart__mdt ami;
    static  ID listingID ;
    static List<Id> listListingId;
    static String preferenceName ;
    
    static void setupTestData() {
        Id rtId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('Household').getRecordTypeId();
        acc = new Account();
        acc.Name = 'Test Account';
        acc.RecordTypeId = rtId;
        acc.AccountNumber = '12345';
        insert acc;
        
        Development__c dev = new Development__c();
        dev.Name_of_Development__c = 'amli';
        dev.Project_ID__c = '123';
        insert dev;
      
        Building__c build = new Building__c();
        build.Development__c = dev.Id;
        build.Developer__c = acc.Id;
       	insert build;
        
        Listing__c listing = new Listing__c();
        listing.name='somelisting';
        listing.Building__c  = build.id;
        listing.Account__c = acc.Id;
        listing.Status__c = 'Active';
        listing.Does_Match__c = true;
        insert listing;
        /*
        Lottery_Preference__c lp = new Lottery_Preference__c();
        lp.Name = 'Test Lottery Preference';
        lp.Status__c = 'New';
        insert lp;
       	preferenceName = lp.Name;
        
        Listing_Lottery_Preference__c llp = new Listing_Lottery_Preference__c();
        llp.Listing__c = listing.Id;
        llp.Lottery_Preference__c = lp.Id;
        insert llp;
        */
        Unit__c unit = new Unit__c();
        unit.property__c  = build.id;
        unit.BMR_Rent_Monthly__c = 400;
        unit.Rent_Multiple__c=3;
        unit.of_AMI_for_Pricing_Unit__c=55;
        unit.Listing__c = listing.id;
        unit.Number_of_Bedrooms__c = 3;
        insert unit;
        
        listingID = listing.id;
        listListingId = new List<Id>();
        listListingId.add(listingID);
        
        /*ami = new AMI_Chart__mdt();
        ami.Year__c = 2016;
        ami.Type__c = 'HUD Unadjusted';
        ami.name='asdf';
        ami.amount__c = 40000;
        ami.Num_of_HouseHold__c=2;
        ami.Percent_of_Median__c=100;
        insert ami;
        
        ami = new AMI_Chart__mdt();
        ami.Year__c = 2016;
        ami.Type__c = 'HUD Unadjusted';
        ami.name='asde';
        ami.amount__c = 30000;
        ami.Num_of_HouseHold__c=1;
        ami.Percent_of_Median__c=90;
        insert ami;*/
    }

    static testMethod void testGetAPIValues() {
        setupTestData();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/ami';  
        req.addParameter('year', '2016');
        req.addParameter('chartType', EncodingUtil.urlEncode('Non-HERA','UTF-8'));
        req.addParameter('percent', '100');
        req.addParameter('amount', '40000');
        req.addParameter('householdsize', '2');
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        system.assert(ListingAMIApi.doGet().size() == 1);
        
    }
    static testMethod void testGetAPICalculateValues() {
        setupTestData();
        RestRequest req = new RestRequest(); 
        RestResponse res = new RestResponse();
        
        req.requestURI = '/ami/calc/'; 
        req.addParameter('year', '2016');
        req.addParameter('chartType', EncodingUtil.urlEncode('Non-HERA','UTF-8'));
        req.addParameter('amount', '40000');
        req.addParameter('householdsize', '2');
        req.httpMethod = 'GET';
        RestContext.request = req;
        RestContext.response = res;
        
        //verify if there are params set then should return 1 record
        //system.assert(ListingAMIApi.doGet().size() == 1);
    }
}