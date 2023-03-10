//
//  main.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 28/02/23.
//

import Foundation

var name: String = ""
var choosepot1: String = ""
var heal: String = ""
var choose: String = ""
var hp: Int = 100
var potions : Int  = 20
var elixer : Int  = 5
var golem : String = "Golem x1"
var troll : String = "Troll x1"
var trollhp : Int=1000
var golemhp : Int=1000
var mp : Int=50

//play game
Game()

//


//func
func validateInput(_ input: String) -> Bool {
    var letters = CharacterSet.letters
    var range = input.rangeOfCharacter(from: letters)
    return range != nil
}

func Game(){
    //opening screen
    print("Welcome to the world of magic! 🧙‍♂️🧌\n")
    print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.")
    print("Press [return] to continue: ")
    var input = readLine()
    while(input != ""){
        print("Press [return] to continue: ")
        input = readLine()
    }

    //Welcoming screen
    print("May I know your name, a young wizard?\n ")
    name = readLine()!


    while name == nil ||   !validateInput(name){
        print("May I know your name, a young wizard?\n ")
        name = readLine()!
    }
    print("Nice to meet you \(name)!\n")
    JourneyScreen()
    
    }

func fleeFromBattle(){
    print("You feel that if you don't escape soon, you won't be able to continue the fight.\nYou look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.\n \nYou're safe, for now.\nPress [return] to continue:")
    var input = readLine()
    while(input != ""){
        print("Press [return] to continue: ")
        input = readLine()
    }
    //new game
    hp=100
    mp=50
    potions=20
    name=""
    Game()
}


func JourneyScreen(){
    //Journey Screen
//    while(choose.lowercased() != "C" || choose.lowercased() != "H" || choose.lowercased() != "F" || choose.lowercased() != "M" || choose.lowercased() != "Q"){
        print("From here, you can....\n \n[C]heck your health and stats \n[H]eal your wounds with potion\n \n...or choose where you want to go\n \n[F]orest of Troll\n[M]ountain of Golem\n[Q]uit game \n \nYour choice?\n")
        
        choose = readLine()!
        switch choose.uppercased() {
        case "C":
            //    PlayerStats(name: name)
            
            
            //Player stats screen
            //func PlayerStats(name : String)-> String{
            print("Player name: \(name)\n \nHP: \(hp)/100 \nMP: \(mp)/50 \n \nMagic: \n- Physical Attack. No mana required. Deal 5pt of damage.\n- Meteor. Use 15pt of MP. Deal 50pt of damage.\n- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \nItems:\n- Potion x20. Heal 20pt of your HP.\n- Elixir x5. Add 10pt of your MP.\n \nPress [return] to go back: ")
            var input1 = readLine()
            while(input1 != ""){
                print("Press [return] to go back: ")
                input1 = readLine()
            }
    //        break
                    JourneyScreen()
            //    return
            //}
            
        case "H":
            //heal wound screen
            healWoundScreen()
            
        case "F":
            //Forest Of troll
           forestTrollScreen()
        case "M":
            //Mountain Golem Screen
            print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.\n👿 Name: \(golem)\n👿 Health: \(golemhp) \n \nChoose your action: \n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
            var chooseM = readLine()!
            //checker input int atau bukan
            switch chooseM {
            case "1":
                print("y")
            case "2":
                print("y")
            default:
                break
                //            print("y")
            }
            
        case "Q":
            //Flee from battle screen
            fleeFromBattle()
        default:
            print("Wrong Input, Input Again!!")
            JourneyScreen()
    }
   
}

func healWoundScreen(){
    print("Your HP is \(hp). \nYou have \(potions) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
    heal = readLine()!
    
    if (heal.uppercased() == "Y"){
        //while potions belum 0
        if potions==0{
            //run out of potion
            print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            var inputret = readLine()
            while(inputret != ""){
                print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
                inputret = readLine()
            }
        }else{
            healWound()
        }
        healWoundScreen()
//        JourneyScreen()
        
        //                JourneyScreen()
    }else if (heal.uppercased()=="N"){
        print("Cancelled")
        JourneyScreen()
    }else{
        while(heal.uppercased() != "N" || heal.uppercased() != "Y"){
            print("Wrong Input, Input Again!!")
            healWoundScreen()
            print("Your HP is \(hp). \nYou have \(potions) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
            heal = readLine()!
           
        }
           
       
    }
    
}

func enemyVitalScreenTroll(){
    print("Name: \(troll)\n\n HP: \(trollhp)/1000\n\n Attack: 10pt—20pt of damage\n\nPress [return] to go back: ")
    var back= readLine()
    while(back != ""){
        print("Press [return] to go back: ")
        back = readLine()
    }
   forestTrollScreen()
}

func forestTrollScreen(){
    print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n \n👿 Name: \(troll)\n\n 👿 Health: \(trollhp) \n \n Choose your action:\n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
    var chooseF : Int?
    chooseF = Int(readLine()!)
    
    //checker input int atau bukan
    switch chooseF {
    case 1:
        //Physical attack
       physicalAttackTroll()
    case 2:
        //meteor
        meteorTroll()
    case 3:
        //shield
        shieldTroll()
    case 4:
        //potions
        healWoundScreen()
    case 5:
        //scan enemy
       enemyVitalScreenTroll()
    case 6:
        //flee from battle
        fleeFromBattle()
    default:
        print("Wrong Input, please reinput!!")
        forestTrollScreen()
    }
}
func meteorTroll(){
    
}
func shieldTroll(){
    
}
func physicalAttackTroll(){
    
}


//method
func physicalAttackTroll(){
    var hpbaru = hp - 5
    
    if(potions<1){
        print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
        var inputret = readLine()
        while(inputret != ""){
            print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            inputret = readLine()
        }
        JourneyScreen()
    }else if(hp == 100){
        
        print("Cannot consume any potions, your hp is full")
        JourneyScreen()
    }
    else{
        if (hpbaru >= 100){
            var sisa = hpbaru-100
            potions-=1
            hp = hp + 20 - sisa
        }else{
            potions-=1
            hp+=20
            print("Your HP is now: \(hp). \nYou have \(potions) Potions left.\n \nStill want to use 1 potion to heal wound again? [Y/N]")
            choosepot1 = readLine()!
            
            
            healWound()
//            while(choosepot1.lowercased() != "n"){
//                while (choosepot1.lowercased() == "y"){
//
//                }
//
//            }
        }
       
    }
}

func healWound(){
    var cobahp = hp
    var hpbaru = hp + 20
    
    if(potions<1){
        print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
        var inputret = readLine()
        while(inputret != ""){
            print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            inputret = readLine()
        }
        JourneyScreen()
    }else if(hp == 100){
        
        print("Cannot consume any potions, your hp is full")
        JourneyScreen()
    }
    else{
        if (hpbaru >= 100){
            var sisa = hpbaru-100
            potions-=1
            hp = hp + 20 - sisa
        }else{
            potions-=1
            hp+=20
            print("Your HP is now: \(hp). \nYou have \(potions) Potions left.\n \nStill want to use 1 potion to heal wound again? [Y/N]")
            choosepot1 = readLine()!
            
            
            healWound()
//            while(choosepot1.lowercased() != "n"){
//                while (choosepot1.lowercased() == "y"){
//
//                }
//
//            }
        }
       
    }
}

