//
//  Golem.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

class Golem: Enemy {
    
    override init(_ enemyName: String, _ enemyHp: Int) {
        super.init(enemyName,enemyHp)
    }
    
    func GolemPunch(_ player: Player){
        //checker
        print("Golem Punch!! player lose 20 hp")
        player.hp = player.hp - 20
        mountainGolemScreen()
    }
}
