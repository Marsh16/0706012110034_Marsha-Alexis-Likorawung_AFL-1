//
//  main.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 28/02/23.
//

import Foundation

var name: String = ""
var choose: String = ""
var hp=100
var potions=20
var golem="Golem x1"
var troll="Troll x1"
var trollhp=1000
var golemhp=1000
var mp=50

Game()
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

    //Journey Screen
    print("From here, you can....\n \n[C]heck your health and stats \n[H]eal your wounds with potion\n \n...or choose where you want to go\n \n[F]orest of Troll\n[M]ountain of Golem\n[Q]uit game \n \nYour choice?\n")

    choose = readLine()!
    switch choose.uppercased() {
    case "C":
        //    PlayerStats(name: name)
        
        
        //Player stats screen
        //func PlayerStats(name : String)-> String{
        print("Player name: \(name)\n \nHP: \(hp)/100 \nMP: \(mp)/50 \n \nMagic: \n- Physical Attack. No mana required. Deal 5pt of damage.\n- Meteor. Use 15pt of MP. Deal 50pt of damage.\n- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \nItems:\n- Potion x10. Heal 20pt of your HP.\n- Elixir x5. Add 10pt of your MP.\n \nPress [return] to go back: ")
        var input1 = readLine()
        while(input1 != ""){
            print("Press [return] to continue: ")
            input1 = readLine()
        }
        //    return
        //}
        
    case "H":
        //heal wound screen
        
        print("Your HP is \(hp). \nYou have \(potions) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
        var heal = readLine()
        if heal=="Y".lowercased(){
            if potions==0{
                //run out of potion
                print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            }else{
                //masih ada potion
                //belum function pengurangan
                print("Your HP is now: \(hp). \nYou have \(potions) Potions left.\n \nStill want to use 1 potion to heal wound again? [Y/N]")
                var choosepot = readLine()
                print(choosepot)
                //funtion looping choosen
            }
            
            
        }else if heal=="N".lowercased(){
            
            
        }else{
            print("Not Valid Input")
            while(heal != "N".lowercased() || heal != "Y".lowercased()){
                print("Your HP is \(hp). \nYou have \(potions) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
                heal = readLine()
                
            }
        }
        
    case "F":
        //Forest Of troll
        print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n \n👿 Name: \(troll)\n\n 👿 Health: \(trollhp) \n \n Choose your action:\n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
        
    case "M":
        //Mountain Golem Screen
        print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.\n👿 Name: \(golem)\n👿 Health: \(golemhp) \n \nChoose your action: \n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
        
    case "Q":
        //Flee from battle screen
        print("You feel that if you don't escape soon, you won't be able to continue the fight.\nYou look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.\n \nYou're safe, for now.\nPress [return] to continue:")
        var input = readLine()
        while(input != ""){
            print("Press [return] to continue: ")
            input = readLine()
        }
        Game()
    default:
        print("Have you done something new?")
        print("You feel that if you don't escape soon, you won't be able to continue the fight.\nYou look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.\n \nYou're safe, for now.\nPress [return] to continue:")
        var input = readLine()
        while(input != ""){
            print("Press [return] to continue: ")
            input = readLine()
        }
        Game()
    }

}

//


//func
func validateInput(_ input: String) -> Bool {
    var letters = CharacterSet.letters
    var range = input.rangeOfCharacter(from: letters)
    return range != nil
}

