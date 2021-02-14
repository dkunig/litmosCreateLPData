February 14, 2021
This apex is strictly for introducing learning paths into a sandbox or developer org for testing purposes only.
This apex creates learning path records in your org, but does not include all fields brought over by the Litmos-Salesforce integration. This code should only be used in an org WITHOUT an active integration.
If you want to bring more fields for additional testing, add them to the record definition.
Once this information is in the org, see other Learning Path repositories for additional Apex for bringing in Descriptions, Litmos Ids (required for further updates), Learning Path --> Course connections, etc.
Replace 'apikey' with the apikey for your desired org, or retrieve the active Litmos__Configuration__c record for your desired org.

See https://support.litmos.com/hc/en-us/articles/227734667-Overview-Developer-API for information on the Litmos API.


NOTE: I am in no way affiliated with Litmos. I'm writing this code to extend the functionality of the Litmos-Salesforce connection. Comments, suggestions, and requests are appreciated.

Developed by Dawn Kunig, Kunig Consulting
Salesforce Certified Administrator
Salesforce Certified Platform App Builder
Salesforce Certified Platform Developer
https://trailblazer.me/id/dkunig5

