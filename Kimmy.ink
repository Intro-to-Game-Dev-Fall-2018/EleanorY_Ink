VAR money = 25
VAR DiceNum = 2
VAR RopeNum = 2
VAR FriseebNum = 1
VAR ChalkNum = 1
VAR BallNum = 1
VAR NotepadNum = 1

VAR HaveGame = false

Dana:			Mom! Look! God sent me a baby!
Mom:			...Excuse me?
Dana:			Her name is Kimmy!
Kimmy:			...
Mom:			That… No, Dana. God did not send you a baby.
Dana:			What do you mean…? You said God sends people babies sometimes! You told me that.
Mom:			Well… nevermind what I said. It doesn’t apply to you. God isn’t about to send you a baby anytime soon, trust me.
Dana:			What! Why? I wished for a baby, and he granted my wish. Isn’t it obvious?
Mom:			Where did you find this little girl? Honey, where’s your house?
Kimmy:			...
Mom:			Kimmy, can you tell me where your parents are?
Kimmy:			I can go home later if I want…
Dana:			Well maybe God didn’t send her, but she came out of nowhere! Kimmy, you just… appeared, right? Where did you come from?
Kimmy:			Ferry Street... I untied myself from the porch so I could go for a walk…
Dana:			...
Mom:			It’s ok deear, let’s go to your house Kimmy… you said it’s on Ferry Street? Your parents are probably worried.

+ Kimmy's House 

-> KimmysHouse

== KimmysHouse ===
Dana:			I’m sorry… I thought God sent me a baby and I got so excited…
KimmyMom:			Oh, don’t worry. Thank you for finding Kimmy and walking her home. What's your name, dear?
Dana:			I’m Dana…
KimmyMom:			I don’t know many kids as responsible as you, walking Kimmy all the way home. I hope you two can be friends. I know Kimmy could learn a lot from you.
Kimmy:			My… friend?
Dana:			Yes! I’d love to be friends, Kimmy. Can I come by and play with you tomorrow?
KimmyMom:			I’ve been looking for a babysitter, actually. Her grandma was helping with that before, but she… well, she can’t anymore.
KimmyMom:			Kimmy’s normally alright in her harness on the porch, but she’s getting a little old for that…
KimmyMom:			If you’d like to play with Kimmy tomorrow, I’d be happy to pay you a quarter to keep an eye on her.
Dana:			Wow! Yes, please! I’d love to!
KimmyMom:			My work schedule is a little… hectic. It’d be great to have you by in the morning.
Dana:			I’ll be here first thing! Wow, I didn’t expect to land a job today. Thanks so much!
Mom:			Well, that all sounds good to me. A summer job will be a nice way to keep busy. Now then, let’s leave this nice family to their dinner.
Dana:			Ok. Bye bye Kimmy, and Mrs...?
KimmyMom:			Mrs. Munro. Again, thank you for giving Kimmy a hand. It was nice meeting you, Mrs. Navarro.
Mom:			Likewise.
Kimmy:			Bye bye.

+ The Next Morning
-> Day1


=== Day1 ===
Dana:			Mornin’ Kimmy! I’m here to babysit, like I promised! Is your mom around?
Kimmy:			My mommy’s not inside. She left already.
Dana:			Oh, ok… Um, well… Is there anything you’d like to do today, Kimmy?
Kimmy:			No… I don’t know.
Dana:			That’s ok, do you have a friend you’d like to visit?
Kimmy:			No...
Dana:			Should we watch TV or something in your house?
Kimmy:			We don’t have a TV. My dad is in there too, so we should go play somewhere else. He’s busy.
Dana:			Ok then! Want to walk around and play some games with the other kids?
Kimmy:			Other kids…?
Dana:			You know, the neighborhood kids. Like Donna. Isn’t she your age? You’re both going to be in Kindergarten, right?
Kimmy:			Oh, yeah… I don’t think Donna is my friend though, so she probably wouldn’t want to play...
Dana:			Well, let’s go become her friend! There's lots of other kids around, too. Like Anthony. I know him from school.
Dana:			Come on, let’s go!
Kimmy:			...!



+ Downtown
-> Downtown
   
+ Home
-> Home

+ Playground
-> Playground

+ [Kimmy's House]
-> KimmyHouseDay1

=== Downtown ===
 + [Talk to Jimmy]
        -> Jimmy
 + [Talk to Anthony]
        -> AnthonyAmber

    = Jimmy
    Jimmy:			...Hi Kimmy.
    Kimmy:			Hi Jimmy…
    Dana:			...
    Dana:			Whatcha reading there, Jimmy? Looks neat.
    Jimmy:			M-my comic… Archie...
    Dana:			Some of my friends at school read that! Did you get it at the bookstore?
    Jimmy:			Yeah!
    Kimmy:			I’ve never read a comic before.
    Jimmy:			Y-you can borrow one of mine whenever you like, Kimmy! And then we can uh…
    Jimmy:			We can talk about it and pick our--our favorite characters!
    Dana:			Wow! That’s so nice of you, Jimmy! Guess you have a new friend, Kimmy!
    Kimmy:			I think… that sounds fun...
    Jimmy:			A-anytime, anytime… um…
    Dana:			Say, are you free to play a game with us, Jimmy? We’ll teach you something new!
    Jimmy:			I’m not very good at games… b-but, if Kimmy wants me to...
    Dana:			I’m teaching Kimmy games and helping her make friends this summer.
    Jimmy:			If you’re learning games, can I play games with you on the playground sometimes too, Kimmy? Once school starts?
    Kimmy:			...Ok. I don’t play much at school but I will with you if you want.
    Jimmy:			What! Oh! Yes… yes please…
        + [Check Games In Inventory] 
      {HaveGame == false:
            There is currently no games in Inventory!
            -> ZeroGame
         } 

    = AnthonyAmber
    Dana:			Hey Anthony.
    Anthony:			Hi Dana. It’s so weird seeing you outside of school, haha.
    Amber:			I’m Amber!
    Anthony:			This is my little sister, Amber. Is that your sister, Dana? I didn’t know you had a little sister.
    Dana:			Oh, no… This is Kimmy. I’m her babysitter.
    Anthony:			Isn’t Kimmy the girl that Jim--
    Amber:			Anthony! I know you’re mad at Jimmy, but--
    Anthony:			I know, I know, nevermind.
    Dana:			Uhhhh… what? What’s the gossip?
    Amber:			Nevermind! Hi Kimmy. I remember seeing you walk to school last year. Isn’t it a bit far to walk? You should ride a bike, at least.
    Kimmy:			Oh… I don’t know.
    Anthony:			Are you two headed somewhere? You should hang out with Amber and I.
    Dana:			Well, we’d like to play a game!
    Anthony:			We’d been playing games with Harold earlier… but maybe we could try something new? Amber’s kinda picky though--fair warning.
    Amber:			Am not!
    + [Check Games In Inventory] 
      {HaveGame == false:
            There is currently no games in Inventory!
            -> ZeroGame
         } 

    === games ===
 You add a game.
 ->DONE
=== Home ===
bbb
 ->DONE

=== Playground ===
ccc
 ->DONE
 
=== KimmyHouseDay1 ===
+ [Talk to Donna]
-> Donna

+ [Go To Shop]
-> Shop

= Donna
Kimmy:			Hi Donna.
Donna:			What happened, Kimmy? Did you untie yourself from the porch again?
Kimmy:			...
Dana:			Hi Donna! I’m babysitting Kimmy now, so--
Donna:			So you untied Kimmy from the porch? Better not let her parents catch you.
Dana:			First of all, I’m her babysitter. Second, she’s perfectly able to untie herself. She’s too old for that thing now, even her mom thinks so.
Donna:			She should probably stay on her porch. We’re the same age, but my mom takes me everywhere so I won’t get lost. I bet Kimmy would get lost if she wandered too far.
Dana:			I don’t know about that. Anyways, I was just going to ask if you wanna play with us... but I feel like you're being mean to Kimmy.
Donna:			Oh, no. I'm just being honest!
Dana:			Ok... well, I hope you two can get along, since you're neighbors... want to play a game with us?
Donna:			Well, I’m trying to avoid Harold so it’s probably good to look busy. He keeps trying to tell me that my ears look childish. He is so snobby.
Kimmy:			I like your ears.
Donna:			Oh, thanks. They’re new. Anyways, I wanna play a new game.
    + [Check Games In Inventory] 
      {HaveGame == false:
            There is currently no games in Inventory!
            -> ZeroGame
         } 
        
-> DONE

=== Shop ===
{not ShopIntro: -> ShopIntro} 
{ShopIntro: -> StartShopping}
= ShopIntro
Dean:			Hey, Kid.
Dana:			Hi, Dean. This is Kimmy. I’m babysitting her now.
Dean:			Well lookit that, aren’t you all grown up. You gettin’ paid?
Kimmy:			My mom pays Dana a quarter a day.
Dana:			That’s right! I’m here to buy some things… I mean, I haven’t gotten paid yet. This is my first day. But I have some money saved up!
Dean:			Hah, I wish I had that kinda discipline. I blew my budget on fabric last week.
Dana:			I need to save up money. For college, you know! My mom would get so mad if I didn’t plan ahead.
Dean:			Hah! Your mom’s got the right idea. I wish I’d saved up for college.
Dana:			So what did you spend all your money on? Your sewing classes?
Dean:			Nah, that’s over. I’m workin’ on some Halloween costumes for my cousins… and some new pants for myself. You know, gotta apply those skills somehow.
Kimmy:			I didn’t know people made clothes!
Dean:			They do, Kimmy, they do. I make sweaters, dresses, hats--you name it.
Dana:			You should sell your clothes at Jordan Marsh! That’s where I always find the nicest clothes.
Dean:			Hah! That’s a long ways off for me. But maybe someday… anyways, what can I get for ya?
-> StartShopping

=== StartShopping ===
Dana and Kimmy now have {money} cents in their pocket.
-> List
    = List
        {DiceNum > 0:
            + [Buy a Dice] -> BuyDice
            }
        {RopeNum > 0: 
            + Buy a Rope -> BuyRope
            }
        {FriseebNum > 0:
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
            ~ FriseebNum = FriseebNum - 1
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
            Danna buys a frisbee. Danna has {money} cents left.
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
            Danna buys a frisbee. Danna has {money} cents left.
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
Kimmy:			Thank you Mr. Dean!
Dean:			Bye bye girls. Have fun.
    -> KimmyHouseDay1


=== ZeroGame ===
Dana:			Oh no! I’m sorry… I thought I had some stuff to play games with in my bag… but it looks like I ran out.
Kimmy:			Oh no...
Dana:			It’s ok! Kimmy, let’s run to the store and buy some game pieces! We’ll be right back!
-> Downtown



-> DONE

-> END