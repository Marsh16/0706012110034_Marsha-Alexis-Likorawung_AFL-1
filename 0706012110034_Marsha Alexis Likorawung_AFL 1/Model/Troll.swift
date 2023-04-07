//
//  Troll.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 24/03/23.
//

import Foundation

//merupakan subclass dari class enemy ada protocol troll
class Troll: Enemy,ProtocolTroll {
    
    override init(_ enemyName: String, _ enemyHp: Int) {
        super.init(enemyName,enemyHp)
    }
    
    //untuk attack dari troll yaitu mengembalikan hp dari troll yang telah ter-attack player sebelumnya seperti : saat player pakai meteor atau physical attack, maka, damage 50 atau 5 nya akan dikembalikan ke parameter damage pada method troll shield dan ditambahkan ke hp troll sekarang
    func TrollShield(_ damage: Int){
        enemyHp = enemyHp + damage
        print("The \(enemyName) uses their SHIELD and regain their HP from you Attack. \n**HP+ HP+ HP+** 🛡️🛡️")
        print("\nThe \(enemyName) HP RETURNS TO \(enemyHp)")
        forestTrollScreen()
    }
}
