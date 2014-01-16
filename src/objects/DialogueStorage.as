package objects 
{
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class DialogueStorage 
	{
		private var storage:Array;
		
		public function DialogueStorage() 
		{
			var cpt:Number = 0x66BDEC;
			var msn:Number = 0x99DB79;
			
			var d0:Array = [
msn,
"Hello?",
"Is anyone still onboard?",
"If anyone's onboard, please respond."];

			var d1:Array = [cpt,
"Hello?",
msn,
"Captain Robert? Jesus it's a relief to hear your voice. What is your status?",
cpt,
"...",
"I'm not entirely sure. I.. It looks like the ship is running with limited functionality.",
msn,
"The ship is on an emergency generator right now.",
"It was activated around the same time we lost contact with your team.",
"What is the status of the crew?",
cpt,
"I...I haven't seen anyone onboard.",
"To be frank I don't remember any of this happening.",
msn,
"There should be three others with you onboard the ship.",
"What about you, Captain, what is your status?",
cpt,
"My arm is pretty swollen and my head is spinning right now.",
msn,
"Please advise.",
"...",
"Captain, what is the last thing you remember?",
cpt,
"It's all a blur.",
"I feel like someone hit me with a bat.",
"What did you see on your end?",
msn,
"We had a comm black out a few hours ago, with intermittent bursts from Kato.",
"She was hysterical. Screaming about something happening onboard your ship.",
"We lost her signal shortly after. The last transmission we got was an emergency STAT-3.",
cpt,
"...",
"I'm going to search for the rest of the crew.",
"This isn't adding up at all.",
msn,
"From what we can tell, the emergency lock down is in full effect.",
"Most of the doors can't be accessed right now.",
"In order to gain access to the doors again, you're going to need to revert to normal power.",
"Look around the room you're in. There should be a backup keycard in one of the drawers there.",
"This will give you access to a manual override for some of the doors.",
"It should be enough to get you to the generator from where you are.",
"Also, there should be a mobile comm somewhere in that same area.",
"Pick it up and we can communicate throughout the ship.",
cpt,
"Okay, I found them both.",
"Mission, do you read?",
msn,
"Loud and clear, Captain.",
"Make your way to the generator room.",
"See if you can find any of the crew as well.",
"And Captain?",
cpt,
"Yeah?",
msn,
"Stay safe up there."];

// Outside escape pod
var d2:Array = [
cpt,
"Mission, I'm right outside of the escape pod but it's not opening.",
msn,
"Captain, if you don't have your key, you might be able to find one on your crew.",
"Regardless, you need to first determine what happened to this ship.",
"Continue to the generator. Butler may still be there.",
"That should be your number one priority right now."];

// Restore power.
var d3:Array = [
cpt,
"Mission, I rerouted power to the rest of the ship.",
msn,
"Roger that. We can see the ship again on our end as well.",
"Pulling up the ship's activity log.",
"...",
"Things are looking pretty good.",
"Well all of the elevators aren't responding.",
cpt,
"Yeah I saw that they were offline.",
msn,
"Wait.",
"...",
"There were multiple accesses to the E/E point (Entry/Exit) less than an hour ago.",
"...",
"And the emergency power...It was voluntarily activated on your end.",
"Someone on onboard deliberately sabotaged that ship.",
cpt,
"Is there anyone linked to this?",
msn,
"Not that we can tell.",
"...",
"Alright Captain, we're going to need you to figure out what happened to the rest of the crew.",
"Andy, Roberts, and Julie should be somewhere onboard",
"The best bet would be to make your way to Andy's labs.",
"More compartments should be opened now due to the power returning.",
cpt,
"Copy that, Mission."];

// Find log of Kato
var d4:Array = [
cpt,
"I found a log of what happened to Julie Kato.",
"Someone ejected her into space.",
msn,
"Jesus.",
"...",
"Who would do such a thing?",
"...",
"Captain, I'm sorry.",
"I know you two were close.",
cpt,
"...",
"They...I...was searching for her.",
//"I...I wish I could remember what was the last thing I did with her was.",
msn,
"Continue on your mission.",
"Andy and Bulter could still be on that ship",
"You can't dwell on what happened.",
"We're bringing you home, Captain. That's a promise."];

// Outside storage door
var d5:Array = [
cpt,
"...",
"Mission, I'm getting intermittent knocking coming from a locked door here.",
msn,
"Someone else is alive??",
"What's your position?",
cpt,
"I uh, I'm in storage. Door is square center in the room.",
msn,
"...",
"Captain, you're looking at an excess storage container.",
"Odd. The only way that door can be locked is from the outside, where you are Captain.",
"Can you communicate?",
cpt,
"I'll try.",
"...",
"Hello?",
"...",
"Is someone there?",
"...",
"This is Captain Robert. Who's in there?",
"...",
"...",
"...",
"Mission, I'm getting no response.",
msn,
"Damn.",
"Well the good news is that whoever's in there is going to stay in there.",
"There's no way out of that room without someone unlocking it from the outside.",
"Okay Captain, one of the crew members is in that room. They may need medical attention.",
"You need to get in there. There should be a storage key somewhere onboard the ship.",
"Keep looking for other members of the crew and keep an eye out for that key.",
cpt,
"Copy that."];

// Find remains of crew, find gravity overrider, new mission to get escape pod key.
var d6:Array = [
cpt,
"Mission?",
msn,
"Yes Captain?",
cpt,
"I found what looks like the rest of the crew.",
"There's only remains. Two bodies.",
msn,
"Oh no.",
"...",
"Can you tell what happened?",
cpt,
"There seems to have been some type of struggle.",
"...",
"Andy seems to have multiple puncture marks.",
"There's a lot of blood.",
"...",
"Butler has no obvious lacerations or markings on his body.",
msn,
"What the hell happened onboard that ship?",
"...",
cpt,
"There has to be an explanation for this.",
"I know these people.",
"We could never do these types of things to each other.",
"We were a tight family.",
msn,
"...",
"Captain, that accounts for everyone onboard the ship.",
"...",
"Everyone. Plus one.",
"Whoever is in that supply room was not documented onboard that ship at flight.",
cpt,
"Stowaway?",
msn,
"Impossible. We tightly control everything that goes into that ship before takeoff.",
"Please do not take this the wrong way, Captain.",
"Sir, are you feeling okay?",
cpt,
"...",
"I feel fine. My arm isn't sore anymore and the headache I woke up with is dying down.",
msn,
"But you still don't remember what happened to these people?",
cpt,
"I'm sorry but that's what happened. That's all I can tell at this moment.",
msn,
"We need to keep our options open as to what exactly transpired up there.",
"What ever happened up there has a reasonable explanation.",
"What ever happened could still be happening there, Captain.",
"...",
"Our main concern right now is to bring you home as fast as possible.",
cpt,
"Understood, Mission.",
"I want to know what happened here just as much as you guys do.",
"Hold on, Butler is holding something.",
"...",
"He was holding a gravity override.",
msn,
"What was he doing with a override?",
"The only reason anyone would need that would be to bypass the elevators...",
"...",
"Well at least with that you should be able to access more of the ship.",
"...",
"Captain, we think you should get out of there.",
"What ever caused that to happen to your crew....",
"...Well you may still be in danger.",
"We're requesting you get to the escape pod as soon as possible.",
cpt,
"Roger that.",
msn,
"You're going to need an access key for it.",
"I hate to ask this of you, but can you search the crew for a key?",
cpt,
"...",
"Hold on.",
"...",
"...",
"Nope. Nothing.",
msn,
"Okay. Well search for that key as it will be your only way off that ship.",
cpt,
"I'll definitely keep an eye out for it.",
msn,
"Please keep us updated, Captain.",
cpt,
"As always, Mission.",
0xFFFFFF,
"<<PRESS \'C\' TO TOGGLE LOW GRAVITY>>"
];

// Find odd reports
var d7:Array = [
cpt,
"Mission? I'm starting to think that the crew up here experienced something.",
"There has been multiple reports of strange activity from them.",
msn,
"What are you thinking, Captain? A virus of some type?",
cpt,
"I'm not sure.",
"They speak of creatures onboard the ship.",
"They may have been infected with something.",
msn,
"If it was a virus, why aren't you exhibiting any of these behaviors yourself?",
"And none of this explain what you heard from the storage room.",
cpt,
"I don't know.",
"I'll keep you posted."];

// pick up L2 key and references to alien
var d8:Array = [
cpt,
"I just picked up a Level-2 keycard.",
msn,
"This is awesome news.",
"You should be able to access the rest of the ship now.",
"Any update on the crew's activity?",
cpt,
"...",
"For all intents and purposes, the crew lost it.",
"These reports point to classic cabin fever.",
"They were delusional. Writing of other life forms onboard, amongst other happenings.",
"They couldn't tell when reality stopped and their minds started. ",
msn,
"But Captain...just what do you think is in the storage room then?",
cpt,
"I'm not sure but I'm going to figure this out.",
msn,
"Stay focused and continue forward.",
"Keep searching for that escape pod key."];

// Reference to alien mimic onboard the ship, 10 second gesgation period.
var d9:Array = [
cpt,
"My god..",
"I think they were being picked off. One by one.",
msn,
"Captain, can you repeat?",
cpt,
"There was something onboard.",
"Julie discovered it first and tried to warn the crew but they didn't listen.",
"It went after her the first chance it got.",
"Something came onboard this ship and systematically wiped them all out.",
"...",
msn,
"Are you telling me an alien life form came onboard and killed the rest of your crew?",
cpt,
"Yes. It came onboard and took the shape of the smaller pets after it infected the food.",
"As it grew, it kept feeding.",
"Eventually it took the shape of a person just as easily as it did the pets.",
//"The perfect mimic. The crew never even knew a creature could do such a thing...",
"The perfect mimic. By the time they realized what was happening, it was too late.",
msn,
"Captain.",
"You're tired. You need",
cpt,
"It's in there. In the storage room.",
"I must have got it in there and trapped it.",
msn,
"Please, just continue the search for the escape pod key.",
"Keep a clear head. You're almost through this, man."];

// pick up storage key
var d10:Array = [
cpt,
"Mission. How long did you lose communication with the ship for?",
msn,
"Only for a few hours.",
"Why?",
cpt,
"The creature had a ten second gestation period.",
"...It could have easily moved from one target to another within that timeframe...",
"...",
"Mission, I'm heading to the storage container.",
msn,
"You have the storage key?",
cpt,
"I just picked it up.",
"I need to see what's behind those doors.",
msn,
"Captain, with all due repect, we would strongly advise against that.",
"What ever attacked the crew may still be in there.",
"What ever attacked you may still be in there.",
"Nothing good can come from opening that door.",
cpt,
"The escape pod key may be in there.",
"It's the only place I haven't really looked.",
msn,
"There has to be another way. Somewhere you haven't looked.",
cpt,
"...",
"I'll update you when I get there."];

// outside of storage container, about to open door.
var d11:Array = [
cpt,
"Alright, Mission. I'm about to go in.",
msn,
"Captain, this is a direct order.",
"Do not open that door.",
cpt,
"...",
msn,
"What ever you find in there, be it man or alien, means bad news for you.",
"Please.",
"Don't go in there.",
"There's some things that you can't undo.",
//"Alright Captain, we're going to need you to figure out what happened to the rest of the crew.",
"You've been given a second chance by waking up here without any of the horrors of what happened.",
"...",
"Don't throw it all away.",
cpt,
"I'm sorry, Mission.",
"But I need to know.",
"...",
"In case you don't hear back from me, thanks.",
msn,
"Captain....",
"...",
"..",
"."];


storage = [d0,d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11];
		}
		
		public function getDialogue(i:int):Array
		{
			return storage[i];
		}
		
	}

}