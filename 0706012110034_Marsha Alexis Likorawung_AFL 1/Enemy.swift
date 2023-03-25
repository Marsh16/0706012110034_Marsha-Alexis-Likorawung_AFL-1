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
    
    func EnemyAttack(){
        self.enemyHp = self.enemyHp - 50
    }
}
