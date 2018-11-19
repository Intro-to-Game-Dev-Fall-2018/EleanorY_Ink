VAR money = 25
VAR DiceNum = 2
VAR RopeNum = 2
VAR FrisbeeNum = 1
VAR ChalkNum = 1
VAR BallNum = 1
VAR NotepadNum = 1

VAR HaveGame = false
VAR CurrentLocation = -> Map

VAR Partner = "Kimmy"

Kimmy
+ [Start Game] -> Start

=== Start ===
Dana:			Mom! Look! God sent me a baby!
Mom:			...Excuse me?
Dana:			Her name is Kimmy!
Kimmy:		...
Mom:			That... No, Dana. God did not send you a baby.
+ [?] ->0_1
= 0_1
Dana:			What do you mean...? You said God sends people babies sometimes! You told me that.
Mom:			Well... nevermind what I said. It doesn’t apply to you. God isn’t about to send you a baby anytime soon, trust me.
+ [?!] ->0_2
= 0_2
Dana:			What! Why? I wished for a baby, and he granted my wish. Isn’t it obvious?
Mom:			Where did you find this little girl? Honey, where’s your house?
Kimmy:		...
Mom:			Kimmy, can you tell me where your parents are?
Kimmy:		I can go home later if I want...
+ [...?] ->0_3
= 0_3
Dana:			Well maybe God didn’t send her, but she came out of nowhere! Kimmy, you just... appeared, right? Where did you come from?
Kimmy:		Ferry Street... I untied myself from the porch so I could go for a walk...
Dana:			...
Mom:			It’s ok deear, let’s go to your house Kimmy... you said it’s on Ferry Street? Your parents are probably worried.

+ Kimmy's House 

-> KimmysHouse

== KimmysHouse ===
Dana:			I’m sorry... I thought God sent me a baby and I got so excited...
Kimmy's mom:	Oh, don’t worry. Thank you for finding Kimmy and walking her home. What's your name, dear?
+ [I'm Dana] ->0_4
= 0_4
Dana:			I’m Dana...
Kimmy's mom:	I don’t know many kids as responsible as you, walking Kimmy all the way home. I hope you two can be friends. I know Kimmy could learn a lot from you.
Kimmy:		My... friend?
+ [!!] ->0_5
= 0_5
Dana:			Yes! I’d love to be friends, Kimmy. Can I come by and play with you tomorrow?
Kimmy's mom:	I’ve been looking for a babysitter, actually. Her grandma was helping with that before, but she... well, she can’t anymore.
Kimmy's mom:	Kimmy’s normally alright in her harness on the porch, but she’s getting a little old for that...
Kimmy's mom:	If you’d like to play with Kimmy tomorrow, I’d be happy to pay you a quarter to keep an eye on her.
+ [!!!] ->0_6
= 0_6
Dana:			Wow! Yes, please! I’d love to!
Kimmy's mom:	My work schedule is a little... hectic. It’d be great to have you by in the morning.
Dana:			I’ll be here first thing! Wow, I didn’t expect to land a job today. Thanks so much!
Mom:			Well, that all sounds good to me. A summer job will be a nice way to keep busy. Now then, let’s leave this nice family to their dinner.
+ [Bye] ->0_7
= 0_7
Dana:			Ok. Bye bye Kimmy, and Mrs...?
Mrs. Munro:		Mrs. Munro. Again, thank you for giving Kimmy a hand. It was nice meeting you, Mrs. Navarro.
Mom:			Likewise.
Kimmy:		Bye bye.

+ The Next Morning
-> Day1


=== Day1 ===
Dana:			Mornin’ Kimmy! I’m here to babysit, like I promised! Is your mom around?
Kimmy:		My mommy’s not inside. She left already.
+ [...] ->1_0
= 1_0
Dana:			Oh, ok... Um, well... Is there anything you’d like to do today, Kimmy?
Kimmy:		No... I don’t know.
->1_1
= 1_1
* [Friend?] ->1_2
* [TV?] ->1_3
* [Go out?] ->1_4
= 1_2
Dana:			That’s ok, do you have a friend you’d like to visit?
Kimmy:		No...
->1_1
= 1_3
Dana:			Should we watch TV or something in your house?
Kimmy:		We don’t have a TV. My dad is in there too, so we should go play somewhere else. He’s busy.
->1_1
= 1_4
Dana:			Ok then! Want to walk around and play some games with the other kids?
Kimmy:		Other kids...?
Dana:			You know, the neighborhood kids. Like Donna. Isn’t she your age? You’re both going to be in Kindergarten, right?
Kimmy:		Oh, yeah... I don’t think Donna is my friend though, so she probably wouldn’t want to play...
+ [^_^] ->1_5
= 1_5
Dana:			Well, let’s go become her friend! There's lots of other kids around, too. Like Anthony. I know him from school.
Dana:			Come on, let’s go!
Kimmy:		...!
-> Map


=== Map ===

+ Downtown
-> Downtown
   
+ Home
-> Home

+ Playground
-> Playground

+ [Kimmy's House]
-> KimmyHouseDay1

=== Downtown ===
 ~ CurrentLocation = -> Downtown
 VAR DowntownIntro = true
 {DowntownIntro:
    Dana and Kimmmy are at the Downtown. Jimmy is standing on the left side of the road, while Anthony is standing on the other side with a girl.
    ~ DowntownIntro = false
 }  

 + [Talk to Jimmy]
        -> Jimmy
 + [Talk to Anthony]
        -> AnthonyAmber
 + [Back]
    -> Map
    
    = Jimmy
    ~Partner = "Jimmy"
    Jimmy:		...Hi Kimmy.
    Kimmy:		Hi Jimmy...
    + [...] -> 2_1
    = 2_1
    Dana:			...
    Dana:			Whatcha reading there, Jimmy? Looks neat.
    Jimmy:		M-my comic... Archie...
        + [?] -> 2_2
    = 2_2
    Dana:			Some of my friends at school read that! Did you get it at the bookstore?
    Jimmy:		Yeah!
    Kimmy:		I’ve never read a comic before.
    Jimmy:		Y-you can borrow one of mine whenever you like, Kimmy! And then we can uh... We can talk about it and pick our--our favorite characters!
    + [!] -> 2_3
    = 2_3
    Dana:			Wow! That’s so nice of you, Jimmy! Guess you have a new friend, Kimmy!
    Kimmy:		I think... that sounds fun...
    Jimmy:		A-anytime, anytime... um...
    + [Wanna play?] -> 2_4
    = 2_4
    Dana:			Say, are you free to play a game with us, Jimmy? We’ll teach you something new!
    Jimmy:		I’m not very good at games... b-but, if Kimmy wants me to...
    + [Kimmy is learning, too] -> 2_5
    = 2_5
    Dana:			I’m teaching Kimmy games and helping her make friends this summer.
    Jimmy:		If you’re learning games, can I play games with you on the playground sometimes too, Kimmy? Once school starts?
    Kimmy:		...Ok. I don’t play much at school but I will with you if you want.
    Jimmy:		What! Oh! Yes... yes please...
    -> CheckInventory

    = AnthonyAmber
    ~Partner = "Anthony"
    Dana:			Hey Anthony.
    Anthony:	Hi Dana. It’s so weird seeing you outside of school, haha.
    Amber:		I’m Amber!
    Anthony:	This is my little sister, Amber. Is that your sister, Dana? I didn’t know you had a little sister.
    + [No...] -> Anthony_1
    =Anthony_1
    Dana:			Oh, no... This is Kimmy. I’m her babysitter.
    Anthony:	Isn’t Kimmy the girl that Jim--
    Amber:		Anthony! I know you’re mad at Jimmy, but--
    Anthony:	I know, I know, nevermind.
    + [?????] -> Anthony_2
    =Anthony_2
    Dana:			Uhhhh... what? What’s the gossip?
    Amber:		Nevermind! Hi Kimmy. I remember seeing you walk to school last year. Isn’t it a bit far to walk? You should ride a bike, at least.
    Kimmy:		Oh... I don’t know.
    Anthony:	Are you two headed somewhere? You should hang out with Amber and I.
    + [Game!] -> Anthony_3
    =Anthony_3
    Dana:			Well, we’d like to play a game!
    Anthony:	We’d been playing games with Harold earlier... but maybe we could try something new? Amber’s kinda picky though--fair warning.
    Amber:		Am not!
    -> CheckInventory

 ->DONE
=== Home ===
~ CurrentLocation = -> Home
This area is blocked by a myterious force.

+ [Back]
    -> Map
    
 ->DONE

=== Playground ===
~ CurrentLocation = -> Playground
This area is blocked by a myterious force.

+ [Back]
    -> Map
    
 ->DONE
 
=== KimmyHouseDay1 ===
~ CurrentLocation = -> KimmyHouseDay1
 VAR KimmyHouseIntro = true
 {KimmyHouseIntro:
     The shop right next to Kimmy's house is open right now. Donna is idling outside the shop. 
    ~ KimmyHouseIntro = false
 } 

+ [Talk to Donna]
-> Donna

+ [Go To Shop]
-> Shop

+ [Back]
    -> Map
    

= Donna
~Partner = "Donna"
Kimmy:		Hi Donna.
Donna:		What happened, Kimmy? Did you untie yourself from the porch again?
Kimmy:		...
+ [(^o^)] -> Donna_1
= Donna_1
Dana:			Hi Donna! I’m babysitting Kimmy now, so--
Donna:		So you untied Kimmy from the porch? Better not let her parents catch you.
+ [(0_0)] -> Donna_2
= Donna_2
Dana:			First of all, I’m her babysitter. Second, she’s perfectly able to untie herself. She’s too old for that thing now, even her mom thinks so.
Donna:		She should probably stay on her porch. We’re the same age, but my mom takes me everywhere so I won’t get lost. I bet Kimmy would get lost if she wandered too far.
+ [(0~0)] -> Donna_3
= Donna_3
Dana:			I don’t know about that. Anyways, I was just going to ask if you wanna play with us... but I feel like you're being mean to Kimmy.
Donna:		Oh, no. I'm just being honest!
+ [...] -> Donna_4
= Donna_4
Dana:			Ok... well, I hope you two can get along, since you're neighbors... want to play a game with us?
Donna:		Well, I’m trying to avoid Harold so it’s probably good to look busy. He keeps trying to tell me that my ears look childish. He is so snobby.
Kimmy:		I like your ears.
Donna:		Oh, thanks. They’re new. Anyways, I wanna play a new game.
-> CheckInventory
        
-> DONE

=== Shop ===
{not ShopIntro: -> ShopIntro} 
{ShopIntro: -> StartShopping}
= ShopIntro
Dean:			Hey, Kid.
+ [Hi!] -> Shop_1
= Shop_1
Dana:			Hi, Dean. This is Kimmy. I’m babysitting her now.
Dean:			Well lookit that, aren’t you all grown up. You gettin’ paid?
Kimmy:		My mom pays Dana a quarter a day.
+ [Right!] -> Shop_2
= Shop_2
Dana:			That’s right! I’m here to buy some things... I mean, I haven’t gotten paid yet. This is my first day. But I have some money saved up!
Dean:			Hah, I wish I had that kinda discipline. I blew my budget on fabric last week.
+ [I need to...] -> Shop_3
= Shop_3
Dana:			I need to save up money. For college, you know! My mom would get so mad if I didn’t plan ahead.
Dean:			Hah! Your mom’s got the right idea. I wish I’d saved up for college.
+ [?] -> Shop_4
= Shop_4
Dana:			So what did you spend all your money on? Your sewing classes?
Dean:			Nah, that’s over. I’m workin’ on some Halloween costumes for my cousins... and some new pants for myself. You know, gotta apply those skills somehow.
Kimmy:			I didn’t know people made clothes!
Dean:			They do, Kimmy, they do. I make sweaters, dresses, hats--you name it.
+ [Wow] -> Shop_5
= Shop_5
Dana:			You should sell your clothes at Jordan Marsh! That’s where I always find the nicest clothes.
Dean:			Hah! That’s a long ways off for me. But maybe someday... anyways, what can I get for ya?
-> StartShopping

=== StartShopping ===
Dana and Kimmy now have {money} cents in their pocket.
-> List
    = List
        {DiceNum > 0:
            + [Buy a Dice] -> BuyDice
            }
        {RopeNum > 0: 
            + [Buy a Rope] -> BuyRope
            }
        {FrisbeeNum > 0:
            + [Buy a Frisbee] -> BuyFrisbee
            }
        {BallNum > 0:
            + [Buy a Ball] -> BuyBall
            }
        {ChalkNum > 0:
            + [Buy Chalks] -> BuyChalks
            }
        {NotepadNum > 0:
            + [Buy a NotePad] -> BuyNotePad
            }
        + [Exit Shop]
            -> KimmyHouseDay1

        -> DONE

    = BuyDice

        { money - 4 >= 0: 
            ~ DiceNum = DiceNum - 1
            ~ money = money - 4
            ~ HaveGame = true
            Danna buys a dice. Danna has {money} cents left.
          - else:
            Danna doesn't have enough money!
            
          }
        + [Buy More]
            -> List
        + [Exit Shop]
            -> KimmyHouseDay1
        -> DONE
        
    = BuyFrisbee 
        { money - 5 >= 0: 
            ~ money = money - 5
            ~ FrisbeeNum = FrisbeeNum - 1
            ~ HaveGame = true
            Danna buys a frisbee. Danna has {money} cents left.
          - else:
            Danna doesn't have enough money!
          }
        + [Buy More]
            -> List
        + [Exit Shop]
            -> KimmyHouseDay1
        -> DONE
        
    = BuyBall 
        { money - 3 >= 0: 
           ~ money = money - 3
           ~ BallNum = BallNum - 1
           ~ HaveGame = true
            Danna buys a ball. Danna has {money} cents left.
          - else:
            Danna doesn't have enough money!
          }
        + [Buy More]
            -> List
        + [Exit Shop]
            -> ExitShop
        -> DONE

    = BuyChalks
        { money - 6 >= 0: 
            ~ money = money - 6
            ~ ChalkNum = ChalkNum - 1
            ~ HaveGame = true
            Danna buys a box of chalks. Danna has {money} cents left.
          - else:
            Danna doesn't have enough money!
          }
        + [Buy More]
            -> List
        + [Exit Shop]
            -> ExitShop
        -> DONE
    
    = BuyNotePad
        { money - 3 >= 0: 
            ~ money = money - 3
            ~ NotepadNum = NotepadNum - 1
            ~ HaveGame = true
            Danna buys a notepad. Danna has {money} cents left.
          - else:
            Danna doesn't have enough money!
          }
        + [Buy More]
            -> List
        + [Exit Shop]
            -> ExitShop
        -> DONE
        
    = BuyRope
        { money - 4 >= 0: 
            ~ money = money - 4
            ~ RopeNum = RopeNum - 1
            ~ HaveGame = true
            Danna buys a Rope. Danna has {money} cents left.
          - else:
            Danna doesn't have enough money!
          }
        + [Buy More]
            -> List
        + [Exit Shop]
            -> ExitShop
        -> DONE


= ExitShop
Dana:			Thanks, Dean!
Kimmy:		Thank you Mr. Dean!
Dean:			Bye bye girls. Have fun.
    -> KimmyHouseDay1

=== CheckInventory ===
    + [Check Games In Inventory] 
      {HaveGame == false:
            There is currently no games in Inventory!
            -> ZeroGame
         - else:
            -> Item
         } 

= ZeroGame
Dana:			Oh no! I’m sorry... I thought I had some stuff to play games with in my bag... but it looks like I ran out.
Kimmy:		Oh no...
Dana:			It’s ok! Kimmy, let’s run to the store and buy some game pieces! We’ll be right back!
-> CurrentLocation

= Item
    You have 
 {  DiceNum:
 - 0 :
    <> 2 dices,
 - 1:
    <> 1 dice,
    }
    
 {  RopeNum:
 - 0 :
    <> 2 ropes,
 - 1:
    <> 1 rope,
    }
    
 { FrisbeeNum == 0:
    <> 1 frisbee,
 }
 
  { ChalkNum == 0:
   <> 1 box of chalks,
 }
 
  { BallNum == 0:
   <> 1 ball,
 }
 
  { NotepadNum == 0:
   <> 1 notepad,
 } 
 <> in your inventory.

-> Games

 === Games ===
What do you want to play with?
 {  DiceNum < 2:
    + [Dice] -> DiceGame
    }
    
 {  RopeNum < 2:
    + [Rope] -> RopeGame
    }
    
 { FrisbeeNum == 0:
   + [Frisbee] -> FrisbeeGame
 }
 
  { ChalkNum == 0:
   + [Chalk] -> ChalkGame
 }
 
  { BallNum == 0:
   + [Ball] -> BallGame
 }
 
  { NotepadNum == 0:
   + [Notepad] -> NotepadGame
 } 

+ [Back] -> CurrentLocation 
 
   = DiceGame
Dana: Ok, I'll teach you how to play Yahtzee.
    + You need a twenty-side die -> dice_second_step(false)
    + You need five dice. -> dice_second_step(true)
    + You need 100 dice. -> dice_second_step(false)
  -> DONE
        = dice_second_step(gameState)
        + Then, you have 5 ways to toss the dice at your friend. 
        -> dice_third_step(false)
        + Then, you have 13 combinations of dice that you want to roll. 
        -> dice_third_step(gameState)
        + Then, you have lots of ways to roll dice, but only some are quiet. 
        -> dice_third_step(false)
        
        = dice_third_step(gameState)
        + Now, you take turns rolling the dice. Add them up to get points from certain combinations. 
        -> dice_fourth_step(gameState)
        + Now, you get points if you roll the dice and they don’t make a sound.
        -> dice_fourth_step(false)
        + Now, you get points if you catch the dice when your friend tried to roll them
        -> dice_fourth_step(false)
        
        = dice_fourth_step(gameState)
        + You win if you scored the most points. 
        -> game_result("dice", gameState)
        + You win if you caught the most dice.
        -> game_result("dice", false)
        + You win if you rolled the quietest dice.
        -> game_result("dice", false)
        

  
   = RopeGame
  Dana doesn't know how to play it yet. Eleanor will teach her later.
  + [Try another game?]
            -> Games
  
  = FrisbeeGame
  Dana doesn't know how to play it yet. Eleanor will teach her later.
  + [Try another game?]
            -> Games
  
  = ChalkGame
Dana: Ok, Let's play hopscotch then. I'll teach you how to play hopscotch.
    + You need chalk and snacks -> chalk_second_step("snacks")
    + You need chalk and a rock -> chalk_second_step("rock")
    + You need chalk and eggs -> chalk_second_step("eggs")
  -> DONE
 
        = chalk_second_step(toy)
        + Then, count how many snacks you have and draw that many squares in a column using your chalk.
        {toy == "snacks":
            -> chalk_third_step(toy, true)
        - else:
            -> chalk_third_step(toy,false)
            }
        + Then, put the eggs on the ground and draw small squares around them.
        {toy == "eggs":
            -> chalk_third_step(toy,true)
        - else:
            -> chalk_third_step(toy,false)
            }
        + Then, use your chalks to draw ten squares all in a column, with some rows containing 2 squares.
        {toy == "rock":
            -> chalk_third_step(toy,true)
        - else:
            -> chalk_third_step(toy,false)
            }
        
        
    
        = chalk_third_step(toy, gameState)
        + Now, everyone hops through the squares all at once, trying to pick up snacks. 
        {toy == "snacks":
        you pick {toy}
            -> chalk_fourth_step(toy, gameState)
        - else:
            -> chalk_fourth_step(toy, false)
            }
        + Now, toss the rock into a square and hop to the other end of the column, picking it up on your way back.
        {toy == "rock":
            -> chalk_fourth_step(toy, gameState)
        - else:
            -> chalk_fourth_step(toy, false)
            }
        + Now, each player takes turns hopping through the egg squares, trying not to squash them.
        {toy == "eggs":
            -> chalk_fourth_step(toy, gameState)
        - else:
            -> chalk_fourth_step(toy, false)
            }
        
    
        = chalk_fourth_step (toy, gameState)
        + You win if you pick up your rock without falling or tossing it outside of the column ten times.
        {toy == "rock":
            -> game_result("chalk", gameState)
        - else:
            -> game_result("chalk", false)
            }
        + You win if you pick up the most snacks.
        {toy == "snacks":
            -> game_result("chalk", gameState)
        - else:
            -> game_result("chalk", false)
            }
        + You win if you finish ten turns without breaking more than one egg.
        {toy == "eggs":
            -> game_result("chalk", gameState)
        - else:
            -> game_result("chalk", false)
            }
            


    
  = BallGame
  Dana doesn't know how to play it yet. Eleanor will teach her later.
  + [Try another game?]
            -> Games
  
  = NotepadGame
    Dana doesn't know how to play it yet. Eleanor will teach her later.
  + [Try another game?]
            -> Games


= game_result(toy, gameState)
        {gameState:
            {Partner}: {Ok, that makes sense! | Sure! | Sounds right to me!}
            + One hour later -> GameSuccess
        - else:
            {Partner}: {That sounds wrong, but ok! | That doesn't sound right... | Really? Are you sure you know how to play?}
            + [Try another game?]
            -> Games
            }

= GameSuccess
    {Partner:
    - "Jimmy": -> Jimmy_Success
    - "Donna": -> Donna_Success
    - "Anthony": -> Anthony_Success
    }
= Jimmy_Success    
Kimmy:		You’re not bad at games Jimmy... I think you were good.
Jimmy:		Oh! Thank you... Did you get those toys at the corner store, Dana?
+ [^_^] -> jimmy_success_1
= jimmy_success_1
Dana:			Yup! I had a little money saved up.
Jimmy:		I save up my money for comics, but I’ve been saving up money for a Yo-yo lately.
Kimmy:		I don’t have any money but my mom said that’s ok. I do sometimes wish I could buy more toys though...
Jimmy:		You don’t get an allowance?
Kimmy:		What’s an allowance?
+ [$$$] -> jimmy_success_2
= jimmy_success_2
Dana:			A little money that your parents give you every week, usually.
Kimmy:		Oh...
+ [(-v-)] -> jimmy_success_3
= jimmy_success_3
Dana:			Don’t worry, not everyone gets allowance, Kimmy. Friends are better than money anyways, and we’re going to make lots of friends for you!
Kimmy:		Ok...
Jimmy:		Thanks for... playing nice and helping me because... Because I get nervous because... kids tease me for being slow sometimes and...
+ [`^´] -> jimmy_success_4
= jimmy_success_4
Dana:			They’re bullies. Don’t worry, you’re great. Right Kimmy?
Kimmy:		Yup!
Jimmy:		That’s nice of you...
Kimmy:		Kids tease me too.
Jimmy:		Why would they tease you? You’re so nice...
Kimmy:		I don’t know... People get mad and ask me if I know how to talk...
+ [(`ww´)] -> jimmy_success_5
= jimmy_success_5
Dana:			That’s so stupid. It’s ok to be quiet, don’t let them get to you.
Dana:			If anyone tries to bully either of you, let me know. I’ll deal with them.
Kimmy:		The boys might try to tear your shirt though.
+ [\(`A´)/] -> jimmy_success_6
= jimmy_success_6
Dana:			I’m the fastest runner in school. They can’t touch me. I’ll tell them to shut up and then--
Dana:			I mean I guess I’d just run away and tell my mom and dad...
Dana:			I’m actually not that helpful with bullies, haha. They bug me too.
Jimmy:		My mom says not to walk around too much alone.
+ [Yes!] -> jimmy_success_7
= jimmy_success_7
Dana:			Yes! Being with a buddy is a good idea.
Jimmy:		Maybe next year at school, Kimmy... we can sit together at recess... I know that usually we’re both um... sitting alone... then maybe we won’t get picked on as much...
Kimmy:		If you want, that sounds ok.
+ [^O^] -> jimmy_success_8
= jimmy_success_8
Dana:			You’ve never played together at school before? You two should stick together!
Jimmy:		W-well... we’ve only talked a couple times...
+ [^_^] -> jimmy_success_9
= jimmy_success_9
Dana:			Haha that makes sense, you’re both pretty quiet.
Jimmy:		Um, uh... will you... Does that mean... Uhhhh...
Kimmy:		...
Jimmy:		Will you be my friend, Kimmy?
Kimmy:		...Ok.
+ [lol] -> jimmy_success_10
= jimmy_success_10
Dana:			Haha, you two...
+ [Back]-> CurrentLocation

= Donna_Success  
Donna:		Kimmy loved that. I’m surprised, normally you’re so quiet Kimmy.
Kimmy:		Mom said it’s ok to be quiet.
+ [Right!] -> donna_success_1
= donna_success_1
Dana:			That’s right! Games are a nice way to talk and play with your friends though, don’t you think? Even quiet kids like games, I think, usually.
Kimmy:		... Are we friends? I thought you were my babysitter.
+ [Yes!] -> donna_success_2
= donna_success_2
Dana:			Yes! Of course we’re friends! I know we just met yesterday, but... that’s normal!
Kimmy:		I always thought babysitters were more like parents.
+ [&] -> donna_success_3
= donna_success_3
Dana:			I can be your friend AND your babysitter. We’re having fun playing games together, right? That’s what friends do a lot of the time.
Dana:			Anthony and I became friends by playing games together. We met playing kickball.
Donna:		Anthony and his little sister Amber are... annoying. Don’t tell them I said that though...
+ [??] -> donna_success_4
= donna_success_4
Dana:		    Really? Anthony and I go to the same school and do sports together sometimes. He’s way nicer than the other boys at my school. I like him and Amber.
Donna:		There’s no rule that says you have to like your classmates.
Dana:			Yeah, I know... but Anthony is nice to me, so I like him.
Donna:		Oooh, you like... Like him?
+ [...] -> donna_success_5
= donna_success_5
Dana:			...I’m not going to answer that, Donna. Who I like is none of your business.
Donna:		...Are you gonna walk to Jordan Marsh? That’s where my babysitter used to take me.
+ [Maybe...] -> donna_success_6
= donna_success_6
Dana:			Maybe! Kimmy doesn't seem to know too many people around town though, so I think we should save big trips for later.
Donna:		Playing is fine, but isn’t it boring sometimes? I need more friends  who will go with me to Jordan Marsh. I like going shopping there. I hide in the clothes racks sometimes.
Kimmy:		Dad took me there once. He needed a new leather jacket. But then he bought another new guitar and mom got mad when we came home.
+ [-v-] -> donna_success_7
= donna_success_7
Dana:			Haha, your dad is so weird.
Donna:		I don’t see your dad around much anymore, but I guess that’s because I’m not out on the porch like I used to be.
Kimmy:		Donna used to be in a harness outside, like me.
Donna:		Yeah I used to wear a harness attached to the front door when my mom was cooking or doing laundry. It was so embarrassing.
Donna:		My mom said I’m too big for the harness. I go bike riding a lot now. I went by myself to Jordan Marsh yesterday and got these ears...
Kimmy:		I like them.
+ [(^o^)] -> donna_success_8
= donna_success_8
Dana:		    I like riding my bike to Jordan Marsh too! Sometimes I’ll buy a ribbon if I save up.
Kimmy:		I’ve never worn a ribbon.
+ [?!] -> donna_success_9
= donna_success_9
Dana:			Wow! Really? I can get you one, Kimmy, don’t worry.
Kimmy:		No thank you, I’m not supposed to spend any money. I don’t have any anyways.
Dana:			I’ll save up and get you one!
Donna:		Kimmy, you would look nice in a ribbon. Cat ears too probably.
Kimmy:		...Maybe.
+ [Back]-> CurrentLocation


= Anthony_Success  
Dana:			You two picked that up really fast!
Anthony:    It’s easier to learn games if you work together. I think we make a good team. When Amber doesn’t get distracted, that is.
Amber:		I don’t like boring stuff. This was fun though.
Anthony:	You sound like Donna.
Amber:		No, I don’t! Donna’s annoying, but I’m not.
Anthony:	Well, you’re not as bad as Linda, that’s for sure...
Amber:		Shut up! That’s mean!
Anthony:	Ok, ok, sorry.
Amber:		We should play together at school sometime, Kimmy.
+ [(^_^)] -> anthony_success_1
= anthony_success_1
Dana:			You hear that Kimmy? That’s great! I’m glad that you two go to the same school.
Kimmy:		I don’t play with anyone usually, but I think I’d like that.
+ [haven't] -> anthony_success_2
= anthony_success_2
Dana:			I haven’t seen you out with Amber before. Usually you’re just walking your dog or at baseball practice.
Anthony:	Unfortunately, Mom told us to stick together this summer.
Amber:		I don’t like going outside alone. Some boy was chasing me last month and I tripped and he stole my allowance.
Kimmy:		I hate boys.
Anthony:	Ouch. Can’t really blame you though. There are definitely some bad guys around...
Kimmy:		There are some boys you don’t like...? I thought that all boys are friends?
+ [^v^] -> anthony_success_3
= anthony_success_3
Dana:			Haha, no Kimmy. Some boys really hate each other.
Anthony:	That’s right. Haha, I can’t even stand most of the guys in my class... they don’t pick on me much, but some of the things they say to the girls...
Kimmy:		My mom told me to stay away from boys because they might hurt me.
Amber:		My mom says that too.
+ [^_^] -> anthony_success_4
= anthony_success_4
Dana:			Well, Anthony and I won’t let the bad ones near you. Don’t worry! I’m the fastest runner at school, so I’ll just... carry you.
Anthony:	Haha, aren’t you a majorette, Dana? Just kick them in the... you know.
+ [ewwww] -> anthony_success_5
= anthony_success_5
Dana:		    Gross. Not around these little girls, Anthony.
Amber:		Anthony! Mom said no kicking. No punching. No nothing.
Anthony:	I’m just kidding. But Dana does have a pretty high kick. All you majorettes kick like crazy in those dance routines... it looks kind of painful.
+ [...] -> anthony_success_6
= anthony_success_6
Dana:			I’m better with a baton...
Kimmy:		I want to play with a baton... dad took me to see sports once and I saw the ladies twirling batons. We were far in the back, so they looked really tiny.
Anthony:	You should come to some baseball games Kimmy. I’m on the team. You and Amber can watch together.
Amber:		I’d like that!
Kimmy:		I do like sports. My dad might even take me, if I ask nicely.
+ [\(^o^)/] -> anthony_success_7
= anthony_success_7
Dana:			Awesome! I’ll come too! It’s fun to watch your baseball games, Anthony.
Anthony:	I’ll let you know when the season starts.
+ [Back]-> CurrentLocation

-> END