/*
	This is the interface to be implemented by all trigger handler classes.

	Simply complete the implemented methods which are required for the trigger. Leave any events that you do not need blank.

	Author: Chris Aldridge, http://chrisaldridge.com
*/
public interface ITriggerHandler 
{
	void BeforeInsert(List<SObject> newItems);

	void BeforeUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems);

	void beforeDelete(Map<Id, SObject> oldItems);

	void afterInsert(Map<Id, SObject> newItems);

	void afterUpdate(Map<Id, SObject> newItems, Map<Id, SObject> oldItems);

	void afterDelete(Map<Id, SObject> oldItems);

	void afterUndelete(Map<Id, SObject> oldItems);

	Boolean IsDisabled();
}