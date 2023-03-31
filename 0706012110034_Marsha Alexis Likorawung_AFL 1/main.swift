//
//  main.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 28/02/23.
//

import Foundation

var player = Player("")
var golem = Golem("Golem Hitler", 100)
var troll = Troll("Troll Chaplin", 100)
var damage = 0
//play game
Game()

//
//func
//pengecekan input berupa huruf bukan int
func validateInput(_ input: String) -> Bool {
    let letters = CharacterSet.letters
    let range = input.rangeOfCharacter(from: letters)
    return range != nil
}

func newGame(){
    damage = 0
    player = Player("")
    golem = Golem("Golem Hitler", 100)
    troll = Troll("Troll Chaplin", 100)
}

//untuk memulai game
func Game(){
    //new game
    newGame()
    //opening screen
    print("Welcome to the world of magic! 🧙‍♂️🧌\n")
    print("You have been chosen to embark on an epic journey as a young wizard on the path to becoming a master of the arcane arts. Your adventures will take you through forests 🌲, mountains ⛰️, and dungeons 🏰, where you will face challenges, make allies, and fight enemies.")
    print("Press [return] to continue: ")
    var input = readLine()
    while(input != ""){
        print("Wrong Input")
        print("Press [return] to continue: ")
        input = readLine()
    }
    
    //Welcoming screen
    print("May I know your name, a young wizard?")
    var name = readLine()!
    
    
    while !validateInput(name){
        print("May I know your name, a young wizard?")
        name = readLine()!
    }
    //    new game?
    player = Player(name)
    player.enemy.append(golem)
    player.enemy.append(troll)
    print("Nice to meet you \(player.name)!\n")
    JourneyScreen()
    
}

//untuk keluar dari game dan memulai game baru
func fleeFromBattle(){
    print("You feel that if you don't escape soon, you won't be able to continue the fight.\nYou look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.\n \nYou're safe, for now.\nPress [return] to continue:")
    var input = readLine()
    while(input != ""){
        print("Wrong Input")
        print("Press [return] to continue: ")
        input = readLine()
    }
    Game()
    
}

//Journey Screen halaman utama
func JourneyScreen(){
    //lose and play again
    player.Afterlosing()
    print("From here, you can....\n \n[C]heck your health and stats \n[H]eal your wounds with potion\n[E]lixir for mana\n \n...or choose where you want to go\n \n[F]orest of Troll\n[M]ountain of Golem\n[Q]uit game \n \nYour choice?")
    let choose = readLine()!
    switch choose.uppercased() {
    case "E":
        //untuk menambah mana dari elixer
        player.UseElixer()
        break
    case "C":
        playerStatsScreen()
        break
    case "H":
        //heal wound screen
        healWoundScreen()
        break
    case "F":
        //Forest Of troll
        forestTrollScreen()
        break
    case "M":
        //Mountain Golem Screen
        mountainGolemScreen()
        break
    case "Q":
        //Flee from battle screen
        fleeFromBattle()
    default:
        print("Wrong Input, Input Again!!")
        JourneyScreen()
    }
    
}

//untuk melihat status player
func playerStatsScreen(){
    print("Player name: \(player.name)\n \nHP: \(player.hp)/100 \nMP: \(player.mana)/50 \n \nMagic: \n- Physical Attack. No mana required. Deal 5pt of damage.\n- Meteor. Use 15pt of MP. Deal 50pt of damage.\n- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \nItems:\n- Potion x20. Heal 20pt of your HP.\n- Elixir x5. Add 10pt of your MP.\n \nPress [return] to go back: ")
    var input1 = readLine()
    while(input1 != ""){
        print("Wrong Input")
        print("Press [return] to go back: ")
        input1 = readLine()
    }
    JourneyScreen()
}

//halaman mountain golem
func mountainGolemScreen(){
    for golem1 in player.enemy {
        if golem1 is Golem {
            print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.\n👿 Name: \(golem1.enemyName)\n👿 Health: \(golem1.enemyHp) \n \nChoose your action: \n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
            //checker input int atau bukan
            var chooseM : Int?
            chooseM = Int(readLine()!)
            switch chooseM {
            case 1:
                //Physical attack
                //                for golem1 in player.enemy {
                //                    if golem1 is Golem {
                damage = player.PhysicalAttack(golem1)
                switch(Int.random(in: 1..<3)){
                case 1:
                    //golempunch
                    //                    Golem(golem: player).GolemPunch(player)
                    golem.GolemPunch(player)
                    break
                case 2:
                    //attack biasa
                    golem.EnemyAttack(player)
                    break
                default:
                    golem.EnemyAttack(player)
                    break
                }
                //                    }}
                break
            case 2:
                //meteor
                //                for golem1 in player.enemy {
                //                    if golem1 is Golem {
                damage = player.Meteor(golem1)
                switch(Int.random(in: 1..<3)){
                case 1:
                    //golempunch
                    golem.GolemPunch(player)
                    break
                case 2:
                    //attack biasa
                    golem.EnemyAttack(player)
                    break
                default:
                    golem.EnemyAttack(player)
                    break
                }
                break
            case 3:
                //shield
                player.Shield(golem1)
                break
            case 4:
                //potions
                healWoundScreen()
                break
            case 5:
                //scan enemy
                player.enemyVitalScreen(golem1)
                break
            case 6:
                //flee from battle
                JourneyScreen()
                break
            default:
                print("Wrong Input, please reinput!!")
                mountainGolemScreen()
                break
            }
        }
    }
}

//halaman menyembuhkan heal wound
func healWoundScreen(){
    print("Your HP is \(player.hp). \nYou have \(player.potion) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
    let heal = readLine()!
    while (heal.uppercased() == "Y"){
        //while potions belum 0
        if (player.potion == 0){
            //run out of potion
            print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            var inputret = readLine()
            while(inputret != ""){
                print("Wrong Input")
                print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
                inputret = readLine()
            }
            healWoundScreen()
        }else{
            player.UsePotion()
        }
        healWoundScreen()
    }
    if (heal.uppercased()=="N"){
        print("Cancelled")
        JourneyScreen()
    }else{
        while(heal.uppercased() != "N" || heal.uppercased() != "Y"){
            print("Wrong Input, Input Again!!")
            healWoundScreen()
        }
    }
}

//Halaman forest troll
func forestTrollScreen(){
    for troll1 in player.enemy {
        if troll1 is Troll {
            print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n \n👿 Name: \(troll1.enemyName)\n\n 👿 Health: \(troll1.enemyHp) \n \n Choose your action:\n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
            
            var chooseF : Int?
            chooseF = Int(readLine()!)
            switch chooseF {
            case 1:
                //Physical attack
                damage = player.PhysicalAttack(troll1)
                switch(Int.random(in: 1..<3)){
                case 1:
                    //golempunch
                    troll.TrollShield(player, troll1, damage)
                    break
                case 2:
                    //attack biasa
                    troll.EnemyAttack(player)
                    break
                default:
                    troll.EnemyAttack(player)
                    break
                }
                break
            case 2:
                //meteor
                damage = player.Meteor(troll1)
                //        meteorT()
                switch(Int.random(in: 1..<3)){
                case 1:
                    //golempunch
                    troll.TrollShield(player, troll1, damage)
                    break
                case 2:
                    //attack biasa
                    troll.EnemyAttack(player)
                    break
                default:
                    troll.EnemyAttack(player)
                    break
                }
                break
            case 3:
                //shield
                player.Shield(troll1)
                break
            case 4:
                //potions
                healWoundScreen()
                break
            case 5:
                //scan enemy
                player.enemyVitalScreen(troll1)
                break
            case 6:
                //flee from battle
                JourneyScreen()
                break
            default:
                print("Wrong Input, please reinput!!")
                forestTrollScreen()
                break
            }
        }
    }
}
