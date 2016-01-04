/*
	Example trigger handler for the Account object.

	In this example, we are checking on both before insert and before update to ensure that the name of the account
	does not include the string 'test'.

	Note that we have to implement the other events (BeforeDelete, AfterInsert) etc even though we are not using them (yet).

	Author: Chris Aldridge, http://chrisaldridge.com
*/
public class AccountTriggerHandler implements ITriggerHandler
{
	public static Boolean TriggerDisabled = false;

	/*
		Checks to see if the trigger has been disabled. For example, you could check a custom setting here.
		In this example, a static property is used to disable the trigger.
		In a unit test, you could use AccountTriggerHandler.TriggerDisabled = true to completely disable the trigger.
	*/
	public Boolean IsDisabled()
	{
		return TriggerDisabled;
	}

	public void BeforeInsert(List<SObject> newItems) 
	{
		// Cast the List<Sobject> to List<Account>
		AccountNameCheck((List<Account>)newitems);
	}

	public void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) 
	{
		// Cast the Map<Id, Sobject> to List<Account>
		AccountNameCheck((List<Account>)newitems.values());
	}

	public void BeforeDelete(Map<Id, SObject> oldItems) {}

	public void AfterInsert(Map<Id, SObject> newItems) {}

	public void AfterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems) {}

	public void AfterDelete(Map<Id, SObject> oldItems) {}

	public void AfterUndelete(Map<Id, SObject> oldItems) {}

	/*
		Check the accounts to make sure their name does not contain the text "test".
		If any do, reject them.
	*/
	private void AccountNameCheck(List<Account> accountList)
	{
		// Reject any Accounts which have the word "Test" in the name
		for (Account acc : accountList)
		{
			if (acc.Name.contains('test'))
				acc.Name.addError('You may not use the word "test" in the account name');
		}
	}
}