/*
	Trigger for the Account object.
	Implements all trigger events.
*/
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) 
{
	TriggerDispatcher.Run(new AccountTriggerHandler());
}