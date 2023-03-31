//
//  Troll.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

class Troll: Enemy {
    
    override init(_ enemyName: String, _ enemyHp: Int) {
        super.init(enemyName,enemyHp)
    }
    
    func TrollShield(_ player: Player, _ enemy: Enemy, _ damage: Int){
        enemy.enemyHp = enemy.enemyHp + damage
        print("The \(enemy.enemyName) uses their SHIELD and regain their HP from you Attack. \n**HP+ HP+ HP+** 🛡️🛡️")
        print("\nThe \(enemy.enemyName) HP RETURNS TO \(enemy.enemyHp)")
            print("\nYour HP is now: \(player.hp)")
            forestTrollScreen()
    }
}
