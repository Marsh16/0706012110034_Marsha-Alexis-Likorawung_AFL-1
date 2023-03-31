//
//  Enemy.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

class Enemy{
    var enemyName:String
    var enemyHp: Int
    
    init(_ enemyName: String,_ enemyHp: Int) {
        self.enemyName = enemyName
        self.enemyHp = enemyHp
    }
    
    func EnemyAttack(_ player: Player){
        let newhp = player.hp-15
        if(newhp<0){
            player.hp = 0
            print("You are dead, you lose")
            fleeFromBattle()
        }else{
            player.hp = player.hp-15
            print("The \(enemyName) raises their giant axe and begins to strike you. \n**SLAM** 💥💥")
            print("You are wounded.\nYour HP is now: \(player.hp)")
            if self is Golem {
                mountainGolemScreen()
            }else{
                forestTrollScreen()
            }
        }
    }
}

