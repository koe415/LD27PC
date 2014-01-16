package objects 
{
	/**
	 * ...
	 * @author Galen Koehne
	 */
	public class NotesStorage 
	{
		//MAX STRING
		//Hey you big dummy. I bet you would never dare look above youself in your damn cockpit. But you know what? I go in there all the time! I slightly move your controls and change our directory all the time. Right under your nose! Haha what a fool! Captain Big R! How did you ever get in command of anything is
		//\n
		private var storage:Array;
		
		public function NotesStorage() 
		{
			var n0:String =
"#Vessel on life support, emergency power is active. \n#Seismic activity noted near Greenhouse laboratory. EVA recommended for further investigation. \n#Please consult onboard engineering team immediately.";
				
			var n1:String =
"\nEmergency escape vehicle. \n\nStatus: On standby. \n\nPower: 100 %";


var n2:String =
( <![CDATA[BUT3:Hey you big dummy. I bet you would never dare look above youself in your own damn cockpit. Know what? I go in here all the time! I move your controls and change our directory on the daily! Right under your nose! Haha Captain Big R! How you ever got in command of anything is beyond me.]]> ).toString();

var n3:String =
( <![CDATA[CptLg1:So I'm pretty sure Butler has been going into the cockpit on his freetime (which is excessive might I add. We're here to get a job done. Do it.) If I actually catch him, I'm throwing a hammer at one of the generators and see how he reacts to someone messing with his livelihood.]]> ).toString();

var n3a:String =
( <![CDATA[CptLg2:My damn bird decided to take a no-notice vacation. A nice disappearing act for a few hou...Emergency power has been activated. Odd. Not sure what type of wiring screw up Butler managed to pull here. I'm sure he knows how to handle this....Or not. I'm checking up on him.]]> ).toString();

var n4:String =
( <![CDATA[Engineering note:
IF YOU HAVE TO ASK IF YOU'RE SUPPOSED TO BE HERE, YOU'RE NOT. GO AWAY. NOW.
  - Your resident engineer, Butler.]]> ).toString();
  
var n5:String =
( <![CDATA[CptLg3:I'm not sure how it happened. An airlock was prematurely opened. Julie has not been seen since and I refuse to accept that she slipped up over something so minor. That's not the type of person she is. Searching again in an hour. Hopefully Butler will have us off emergency power by then.]]> ).toString();

var n6:String =
( <![CDATA[ADY1:Our food stocks have somehow got rot on them, despite an extended shelf life. The hell. Worst case scenario? We raid Julie's pretties. If this is some type of bacteria, I haven't a clue where it came from. Maybe the atmo exposure early last month? I seperated the stocks to minimize further issues.]]> ).toString();

var n7:String = "ADY2:Recipe for delicious homemade tacos.\n- Deep fry them tortillas.\n- Fry up chicken until fully cooked!\n- Throw the chicken, lettuce, chopped onions, and sour cream in there!\n(Note to self: Try not to rip open your finger over the food stocks again. The crew might not like that =P)";

var n8:String =
( <![CDATA[ADY3:Thing rotting our food? Miraculously Gone. First time for everything right? Of course Robert has his concerns but we don't really have much of a choice. We won't have enough food to survive the trip unless we dip into the previously sick stock. We'll have to take our chances. Besides its Robert's job to worry Haha]]> ).toString();
//( <![CDATA[Hey you big dummy. I bet you would never dare look above youself in your own damn cockpit. Know what? I go in there all the time! I move your controls and change our directory all the time. Right under your nose! Haha Captain Big R! How did you ever get in command of anything is beyond me.]]> ).toString();
var n9:String =
( <![CDATA[JUL1:Due to overlooked expiration dates, I guess I'm taking less pills now. Maybe that's a good thing? Robert sure as hell doesn't like it but that's Robert. There's nothing we can really do about it this far from home. All alone with nowhere to roam.]]> ).toString();

var n9a:String =
( <![CDATA[JUL2:My babies in the greenhouse are doing well enough. Sitting alone amongst the flowers I can almost forget where we are. But then I open my eyes and Robert's just standing there. Weirdo. Well I guess not all is lost. Speaking of lost, I still haven't found Mr. Mouse since this morning. Where could she be..]]> ).toString();

var n10:String =
( <![CDATA[ADY4:Things on the ship have taken a weird turn for the last few hours. Like stepping into one of those horror movies, we have Julie weirding everyone out. Comes in screaming of a messed up version of me but not me? Who creeps around like that? And an evil me? Really? I think we found our pycho killer, hello!]]> ).toString();

var n11:String =
( <![CDATA[BUT1:Robert just ignores all the signs until it's too late. Julie may have gone nuts recently but it was a long road here. It's as much fault on Robert as it is on this place. Of course if I mention any of this to them, they can hold me in contempt and all that entails. BS. It's all just some game where I always lose.]]> ).toString();

var n12:String =
( <![CDATA[BUT2:Julie's accident has thrown Robert into a daze. He is barely there, just going through the motions. Robert isn't usually phased. I guess I should have suspected their relationship but it doesn't really matter anymore. I think I hear him calling for her. I guess I better help.]]> ).toString();

var n13:String =
( <![CDATA[AUTkOED SYS MSG:PRTSD AIRL ACSED 5X W/I LST HR. CRW MBER ANDY SPTTD IN EXTER.
MULTI_BODIES TRANSITIONIhNeG. EMERGENCY SHUTDOWsN INITED. PLS Waasdmoxzc.#2m]]> ).toString();

var n14:String =
( <![CDATA[CptLg4:Butlers insane too? Did he see something? I just saw him actively hunting whatever he thinks is onboard this ship. Maybe Julie was right? This place is falling apart. I can hear him making his way toward Andy. I need to warn him before Butler does something stupid.]]> ).toString();
//( <![CDATA[Hey you big dummy. I bet you would never dare look above youself in your own damn cockpit. Know what? I go in there all the time! I move your controls and change our directory all the time. Right under your nose! Haha Captain Big R! How did you ever get in command of anything is beyond me.]]> ).toString();
var n15:String =
( <![CDATA[JUL3:I broke down today. I know how it looks. How everyone looks at me. How Robert looks at me. I didn't want any of this. It's not the lack of meds that are doing this. I saw something. Someone. I mean I am the first to admit how this sounds. How excited I can get. But I saw it. Those horrible eyes. Andys eyes.]]> ).toString();

var n15a:String =
( <![CDATA[JUL4:It looked back at me. And then I ran. I ran as far away as I could get from it. And the huge relief when I ran into the guys. And their faces staring back at me when I told them what I saw. The meds can't fix this problem. Sorry. I didn't mean to go crazy on you guys. But I still hear it in the vents.]]> ).toString();

var n16:String =
( <![CDATA[ADY5:Holy mother of God. I thought I imagined it. I snapped out of bed and looked around. Seeing nothing, I went back to sleep. Then I heard it. A roar coming from down the hall. What the hell is happening out there? I'm going back to my lab and locking myself in until someone figures this out.]]> ).toString();

var n17:String =
( <![CDATA[ADY6:I think I got it. Julie may have saw something out there. The creature she saw might actually have been a replica of me. The rot from earlier somehow adapted to the ship from whatever environ it came from. It replicated the food supplies. Then the smaller animals. And now us.]]> ).toString();

var n17a:String =
( <![CDATA[ADY7:Sent a sample up to see their gestation rate. Due to my proximity with the food storage, it may have used me as its guinea pig after the pets? From what I've seen of our food stocks, this thing can only hold a form for a limited number of hours before reverting back to it's original form. We can wait it out.]]> ).toString();

var n17b:String =
( <![CDATA[ADY8:Perhaps the creature was fighting for a spot on our crew? Maybe it ejected her? It may have needed a new host before it reverted back. Robert just told me Butler is coming my way to help fight the creature. Perhaps together we can smoke this creature out. He's outside my lab banging on the door. I thi]]> ).toString();

var n18:String =
( <![CDATA[CptLg5:Well it seems like I am the lone survivor onboard this ship. Last thing I heard on the comms was yelling. Then static. No Bulter. No Andy. No one. Damnit. I guess this is as good a fate as any. Had hoped someone would come back but it's too late. I can hear the creature outside the door.]]> ).toString();

var n18a:String =
( <![CDATA[CptLg6:I glimpsed at it before I got in. It looked like Andy but not quite. Warped. I wonder where it came from? Can it talk? Does it have Andy's memories? It looks like it's mid-transformation. Almost a perfect copy. Will it do me next? Will it think like me? Talk like me? For all intents and purposes will it be me?]]> ).toString();
//( <![CDATA[Hey you big dummy. I bet you would never dare look above youself in your own damn cockpit. Know what? I go in there all the time! I move your controls and change our directory all the time. Right under your nose! Haha Captain Big R! How did you ever get in command of anything is beyond me.]]> ).toString();

var n19:String =
( <![CDATA[Sample A: gestation perd ~0.1 seconds. dur perd ~19 mins
Sample B: gestation perd ~0.2 seconds. dur perd ~23 mins
Analysis:If adapted to humans, can be assumed: gestation perd ~10.3 seconds. dur perd ~17 hrs]]> ).toString();

var n20:String =
( <![CDATA[CptLg7:Im sorry Julie. I should have listened. I'm going to make a break for it. I think the escape pod is still attached. I'll power it up and grab the extra key in the loft. If I find it, I'm putting up a fight. Know that it wasn't us that turned on each other. It was the unknown that enveloped us. Captain signing off.]]> ).toString();
				
var n21:String = "Wow. Okay. You're one clever bastard. I didn't think anyone would actually be able to get here. The fact that you got so far in this game amazes me. You're fucking awesome. Keep on rocking man. BTW Press Q to fly like the free bird you are because obviously these walls can't hold you back! -GK";

			storage = [n0, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,n12,n13,n14,n15,n16,n17,n18,n19,n20,n3a,n9a,n15a,n18a,n17a,n17b,n21];
			
		}
		
		public function getNote(i:int):String
		{
			return storage[i];
		}
		
	}

}