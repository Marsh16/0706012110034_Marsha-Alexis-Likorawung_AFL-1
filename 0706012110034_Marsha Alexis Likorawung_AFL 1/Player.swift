//
//  Player.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

class Player{
    var name:String
    var hp: Int
    var potion: Int
    var mana: Int
    var elixer: Int
    var enemy: [Enemy] = []
    
    init(_ name: String) {
        self.name = name
        self.hp = 100
        self.potion = 10
        self.mana = 50
        self.elixer = 15
        //random isi name dan hp dari enemy subclass golem dan troll
        self.enemy.append(Enemy("aasdsa", 900))
        self.enemy.append(Enemy("aas", 500))
    }
    
    func meteor(_ enemy: Enemy){
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
                enemy.EnemyAttack()
//                enemy.enemyHp = enemy.enemyHp - 50
                mana = mana - 15
            }
        }
        print("\(enemy.enemyName) taking 50pt of damage.\nYour mana is now \(mana)\nEnemy’s HP is now \(enemy.enemyHp)")
    }
    
    func Shield(){
        
    }
    
}
