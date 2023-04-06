//
//  Player.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

//class player memakai protokol player
class Player: ProtocolPlayer{
    var name:String
    var hp: Int
    var potion: Int
    var mana: Int
    var elixer: Int
    var enemy: [Enemy] = []
    
    init(_ name: String){
        self.name = name
        self.hp = 100
        self.potion = 10
        self.mana = 50
        self.elixer = 15
        self.enemy = []
    }
    
    //untuk player mengaktifkan meteor attack, yang terjadi: hp enemy akan berkurang 50 point dan mana player berkurang 15
    func Meteor(_ enemy: Enemy)-> Int{
        print("=================Meteor Attack===============")
        let hpbaru = enemy.enemyHp - 50
        let mpbaru = mana-15
        if(mpbaru<0){
            print("Mana is not enough to do attack")
            JourneyScreen()
        }else if(enemy.enemyHp==0){
            print("\(enemy.enemyName) is dead cannot attack")
            JourneyScreen()
        }else{
            if(hpbaru<0){
                enemy.enemyHp = 0
                print("\(enemy.enemyName) is dead")
            }else{
                mana =  mana - 15
                enemy.enemyHp = enemy.enemyHp - 50
                print("\(enemy.enemyName) taking 50pt of damage.\nYour mana is now \(mana)\nEnemy’s HP is now \(enemy.enemyHp)")
            }
        }
        return 50
    }
    
    //untuk player mengaktifkan shield, yang terjadi: mana berkurang 10 point dan enemy tidak bisa attack anda
    func Shield(_ enemy: Enemy){
        print("=================Shield===============")
        let mpbaru = mana-10
        if(mpbaru<0){
            print("Mana is not enough to do attack")
            JourneyScreen()
        }else if(enemy.enemyHp==0){
            print("\(enemy.enemyName) is dead cannot attack")
            JourneyScreen()
        }else{
            mana-=10
        }
        print("You are protected by the Shield spell casted before, only for this turn.")
        print("Your HP is still: \(hp)")
        print("You are now invincible for 1 turn.")
        if enemy is Golem {
            mountainGolemScreen()
        }else{
            forestTrollScreen()
        }
    }
    
    //untuk player melakukan physical attack, damagenya 5 dan tidak memakai mana
    func PhysicalAttack(_ enemy: Enemy) -> Int{
        print("=================Physical Attack===============")
        let hpbaru = enemy.enemyHp - 5
        if(hpbaru<0){
            enemy.enemyHp = 0
            print("troll is dead")
            JourneyScreen()
        }else if(enemy.enemyHp==0){
            print("Troll is dead cannot attack")
            JourneyScreen()
        }else{
            enemy.enemyHp = enemy.enemyHp - 5
            
        }
        print("\(enemy.enemyName) taking 5pt of damage.\nNo mana has been used.\n\(enemy.enemyName)’s HP is now \(enemy.enemyHp)")
        return 5
    }
    
    //untuk memakai elixer, menambah mana anda
    func UseElixer(){
        print("Your Mana is now: \(mana). \nYou have \(elixer) Elixer left.")
        let elixirbaru = elixer - 1
        let manabaru = mana + 15
        if(elixirbaru <= 0){
            print("Elixer is empty")
        }else if(manabaru>50){
            print("Mana is full")
        }else{
            elixer = elixer - 1
            mana = mana + 15
        }
        JourneyScreen()
    }
    
    //untuk memakai potion, manambah health anda
    func UsePotion(){
        let hpbaru = hp + 20
        if(potion<1){
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
                potion-=1
                hp = hp + 20 - sisa
            }else{
                potion-=1
                hp+=20
                print("Your HP is now: \(hp). \nYou have \(potion) Potions left.\n \nStill want to use 1 potion to heal wound again? [Y/N]")
                let choosepot1 = readLine()!
                switch choosepot1.uppercased() {
                case "Y":
                    game.player.UsePotion()
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
    
    //untuk melihat enemy vital
    func enemyVitalScreen(_ enemy: Enemy){
        print("Name: \(enemy.enemyName)\n\n HP: \(enemy.enemyHp)/100\n\n Attack: 5pt—50pt of damage\n\nPress [return] to go back: ")
        var back = readLine()
        while(back != ""){
            print("Wrong Input")
            print("Press [return] to go back: ")
            back = readLine()
        }
        forestTrollScreen()
    }
    
    //untuk cek kalau hp enemy sudah 0 semua maka anda kalah
    func Afterlosing(){
        for golem in game.player.enemy {
            for troll in game.player.enemy {
                if golem is Golem && troll is Troll{
                    if( golem.enemyHp == 0 && troll.enemyHp == 0){
                        print("You Win, all enemy are dead")
                        print("Play again?")
                        print("Press [return] to continue: ")
                        var input = readLine()
                        while(input != ""){
                            print("Wrong Input")
                            print("Press [return] to continue: ")
                            input = readLine()
                        }
                        GamePlay()
                    }
                }
            }
        }
    }
}

