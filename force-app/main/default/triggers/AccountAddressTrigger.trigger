trigger AccountAddressTrigger on Account (before insert, before update)
     {
             for(Account acc:trigger.new)
                   {
                          if(acc.match_Billing_Address__c==True)
                                       {
                                                  acc.ShippingPostalCode = acc.BillingPostalCode;
                                         }
                       }
         }