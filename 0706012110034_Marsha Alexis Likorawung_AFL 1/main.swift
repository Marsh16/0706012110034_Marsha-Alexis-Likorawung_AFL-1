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
var potions : Int  = 10
var golem : String = "Golem x1"
var troll : String = "Troll x1"
var trollhp : Int=100
var golemhp : Int=100
var mp : Int=50
var elixir : Int=5

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

//untuk memulai game
func Game(){
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
    name = readLine()!
    
    
    while !validateInput(name){
        print("May I know your name, a young wizard?")
        name = readLine()!
    }
    print("Nice to meet you \(name)!\n")
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
    //new game
    hp=100
    mp=50
    potions=10
    name=""
    trollhp = 100
    golemhp = 100
    elixir = 5
    Game()
}

//untuk pengecekan kalah atau tidak
func Afterlosing(){
    if(trollhp == 0 && golemhp == 0){
        print("You Win, all enemy are dead")
        print("Play again?")
        var input = readLine()
        while(input != ""){
            print("Wrong Input")
            print("Press [return] to continue: ")
            input = readLine()
        }
        fleeFromBattle()
    }
}

//Journey Screen halaman utama
func JourneyScreen(){
    //lose and play again
    Afterlosing()
    print("From here, you can....\n \n[C]heck your health and stats \n[H]eal your wounds with potion\n[E]lixir for mana\n \n...or choose where you want to go\n \n[F]orest of Troll\n[M]ountain of Golem\n[Q]uit game \n \nYour choice?")
    choose = readLine()!
    switch choose.uppercased() {
    case "E":
        //untuk menambah mana dari elixer
        elixirscreen()
    case "C":
        playerStatsScreen()
    case "H":
        //heal wound screen
        healWoundScreen()
    case "F":
        //Forest Of troll
        forestTrollScreen()
    case "M":
        //Mountain Golem Screen
        mountainGolemScreen()
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
    print("Player name: \(name)\n \nHP: \(hp)/100 \nMP: \(mp)/50 \n \nMagic: \n- Physical Attack. No mana required. Deal 5pt of damage.\n- Meteor. Use 15pt of MP. Deal 50pt of damage.\n- Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \nItems:\n- Potion x20. Heal 20pt of your HP.\n- Elixir x5. Add 10pt of your MP.\n \nPress [return] to go back: ")
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
    print("As you make your way through the rugged mountain terrain, you can feel the chill of the wind biting at your skin. Suddenly, you hear a sound that makes you freeze in your tracks. That's when you see it a massive, snarling Golem emerging from the shadows.\n👿 Name: \(golem)\n👿 Health: \(golemhp) \n \nChoose your action: \n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
    //checker input int atau bukan
    var chooseM : Int?
    chooseM = Int(readLine()!)
    switch chooseM {
    case 1:
        //Physical attack
        physicalAttackG()
        golemactionscreen()
    case 2:
        //meteor
        meteorG()
        golemactionscreen()
    case 3:
        //shield
        shieldG()
    case 4:
        //potions
        healWoundScreen()
    case 5:
        //scan enemy
        enemyVitalScreen(enemyname:golem, enemyhp:golemhp)
    case 6:
        //flee from battle
        JourneyScreen()
    default:
        print("Wrong Input, please reinput!!")
        mountainGolemScreen()
    }
}

//halaman menyembuhkan heal wound
func healWoundScreen(){
    print("Your HP is \(hp). \nYou have \(potions) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
    heal = readLine()!
    while (heal.uppercased() == "Y"){
        //while potions belum 0
        if potions==0{
            //run out of potion
            print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
            var inputret = readLine()
            while(inputret != ""){
                print("Wrong Input")
                print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
                inputret = readLine()
            }
        }else{
            healWound()
        }
        healWoundScreen()
        //        JourneyScreen()
        
    }
    if (heal.uppercased()=="N"){
        print("Cancelled")
        JourneyScreen()
    }else{
        while(heal.uppercased() != "N" || heal.uppercased() != "Y"){
            print("Wrong Input, Input Again!!")
            healWoundScreen()
            print("Your HP is \(hp). \nYou have \(potions) Potions.\n \nAre you sure want to use 1 potion to heal wound? [Y/N]")
            heal = readLine()!
            while (heal.uppercased() == "Y"){
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
            }
        }
        
        
    }
    
}

//Halaman forest troll
func forestTrollScreen(){
    print("As you enter the forest, you feel a sense of unease wash over you. Suddenly, you hear the sound of twigs snapping behind you. You quickly spin around, and find a Troll emerging from the shadows.\n \n👿 Name: \(troll)\n\n 👿 Health: \(trollhp) \n \n Choose your action:\n[1] Physical Attack. No mana required. Deal 5pt of damage.\n[2] Meteor. Use 15pt of MP. Deal 50pt of damage.\n[3] Shield. Use 10pt of MP. Block enemy's attack in 1 turn.\n \n[4] Use Potion to heal wound.\n[5] Scan enemy's vital.\n[6] Flee from battle.\n \nYour choice?")
    var chooseF : Int?
    chooseF = Int(readLine()!)
    switch chooseF {
    case 1:
        //Physical attack
        physicalAttackT()
        trollactionscreen()
        break
    case 2:
        //meteor
        meteorT()
        trollactionscreen()
        break
    case 3:
        //shield
        shieldT()
        break
    case 4:
        //potions
        healWoundScreen()
        break
    case 5:
        //scan enemy
        enemyVitalScreen(enemyname:troll, enemyhp:trollhp)
        break
    case 6:
        //flee from battle
        JourneyScreen()
    default:
        print("Wrong Input, please reinput!!")
        forestTrollScreen()
    }
}

//halaman enemy vital
func enemyVitalScreen(enemyname:String, enemyhp:Int){
    print("Name: \(enemyname)\n\n HP: \(enemyhp)/100\n\n Attack: 5pt—50pt of damage\n\nPress [return] to go back: ")
    var back = readLine()
    while(back != ""){
        print("Wrong Input")
        print("Press [return] to go back: ")
        back = readLine()
    }
    forestTrollScreen()
}

//untuk saat menggunakan elixer!!!!!!
func elixirscreen(){
    print("Use Elixer!!!!!!!!!!!!!!!!!!!")
    let elixirbaru = elixir - 1
    let manabaru = mp + 15
    if(elixirbaru <= 0){
        print("elixir habis")
    }else if(manabaru>50){
        print("mana penuh")
    }else{
        elixir = elixir - 1
        
        mp = mp + 15
        
    }
    JourneyScreen()
}

//untuk saat menggunakan physical attack Troll!!!!!!
func physicalAttackT(){
    print("=================Physical Attack===============")
    let hpbaru = trollhp - 5
    if(hpbaru<0){
        trollhp = 0
        print("troll is dead")
    }else{
        trollhp = trollhp - 5
        
    }
    print("Enemy taking 5pt of damage.\nNo mana has been used.\nEnemy’s HP is now \(trollhp)")
    
}

//untuk saat menggunakan physical attack Golem!!!!!!
func physicalAttackG(){
    print("=================Physical Attack===============")
    let hpbaru = golemhp - 5
    if(hpbaru<0){
        golemhp = 0
        print("Golem is dead")
    }else{
        golemhp = golemhp - 5
        
    }
    print("Enemy taking 5pt of damage.\nNo mana has been used.\nEnemy’s HP is now \(golemhp)")
    
}

//untuk saat menggunakan meteor Troll!!!!!!
func meteorT(){
    print("=================Meteor Attack===============")
    let hpbaru = trollhp - 50
    let mpbaru = mp-15
    if(mpbaru<0){
        print("Mana is not enough to do attack")
    }else{
        if(hpbaru<0){
            trollhp = 0
            print("troll is dead")
        }else{
            trollhp = trollhp - 50
            mp = mp - 15
        }
    }
    
    print("Enemy taking 50pt of damage.\nYour mana is now \(mp)\nEnemy’s HP is now \(trollhp)")
    
}

//untuk saat menggunakan meteor Golem!!!!!!
func meteorG(){
    print("=================Meteor Attack===============")
    let hpbaru = golemhp - 50
    let mpbaru = mp-15
    if(mpbaru<0){
        print("Mana is not enough to do attack")
    }else{
        if(hpbaru<0){
            golemhp = 0
            print("Golem is dead")
        }else{
            golemhp = golemhp - 50
            mp = mp - 15
        }
    }
    
    print("Enemy taking 50pt of damage.\nYour mana is now \(mp)\nEnemy’s HP is now \(golemhp)")
    
}

//untuk saat menggunakan shield Troll!!!!!!
func shieldT(){
    print("=================Shield===============")
    let mpbaru = mp-10
    if(mpbaru<0){
        print("Mana is not enough to do attack")
    }else{
        mp-=10
    }
    print("You are protected by the Shield spell casted before, only for this turn.")
    print("Your HP is still: \(hp)")
    print("You are now invincible for 1 turn.")
    forestTrollScreen()
}

//untuk saat menggunakan shield Golem!!!!!!
func shieldG(){
    print("=================Shield===============")
    let mpbaru = mp-10
    if(mpbaru<0){
        print("Mana is not enough to do attack")
    }else{
        mp-=10
    }
    print("You are protected by the Shield spell casted before, only for this turn.")
    print("Your HP is still: \(hp)")
    print("You are now invincible for 1 turn.")
    mountainGolemScreen()
}

//untuk saat troll attack dan pengecekan player mati
func trollactionscreen(){
    let newhp = hp-15
    if(newhp<0){
        hp = 0
        print("You are dead, you lose")
        fleeFromBattle()
    }else{
        hp = hp-15
        print("The Troll raises their giant axe and begins to strike you. \n**SLAM** 💥💥")
        print("You are wounded.\nYour HP is now: \(hp)")
        forestTrollScreen()
    }
    
    
}

//untuk saat golem attack dan pengecekan player mati
func golemactionscreen(){
    let newhp = hp-15
    if(newhp<0){
        hp = 0
        print("You are dead")
        fleeFromBattle()
    }else{
        hp = hp-15
        print("The Golem charges at you, its massive punch pounding against the rocky ground.\n**BAMMM** 💥💥")
        print("You are wounded.\nYour HP is now: \(hp)")
        mountainGolemScreen()
    }
}


//method for healing wounds
func healWound(){
    let hpbaru = hp + 20
    if(potions<1){
        print("You don't have any potion left. Be careful of your next jouney. \nPress [return] to go back:")
        var inputret = readLine()
        while(inputret != ""){
            print("Wrong Input")
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
            let sisa = hpbaru-100
            potions-=1
            hp = hp + 20 - sisa
        }else{
            potions-=1
            hp+=20
            print("Your HP is now: \(hp). \nYou have \(potions) Potions left.\n \nStill want to use 1 potion to heal wound again? [Y/N]")
            choosepot1 = readLine()!
            switch choosepot1.uppercased() {
            case "Y":
                healWound()
            case "N":
                print("Canceled")
                JourneyScreen()
            default:
                print("Wrong Input")
            }
        }
        JourneyScreen()
    }
}
