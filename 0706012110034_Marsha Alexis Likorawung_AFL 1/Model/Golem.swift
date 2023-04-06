//
//  Golem.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

//merupakan subclass dari class enemy
class Golem: Enemy,ProtocolGolem {
    
    override init(_ enemyName: String, _ enemyHp: Int) {
        super.init(enemyName,enemyHp)
    }
    
    //untuk attack dari golem yaitu damagenya ke player sebanyak 20 point
    func GolemPunch(_ player: Player){
        let newhp = player.hp-20
        if(newhp<0){
            player.hp = 0
            print("You are dead, you lose")
            fleeFromBattle()
        }else{
            player.hp = player.hp - 20
            print("The \(enemyName) raises their FIST and begins to PUNCH you. \n**POW POW POW** 💥💥")
            print("You are wounded.\nYour HP is now: \(player.hp)")
            mountainGolemScreen()
        }
    }
}
