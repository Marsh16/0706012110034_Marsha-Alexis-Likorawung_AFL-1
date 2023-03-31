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
    
    func TrollShield(_ player: Player){
        print("Troll Shield")
        forestTrollScreen()
    }
}
