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
    
    //membuat enemy, dalam constructor mengisi nama dan enemy pada parameter
    init(_ enemyName: String,_ enemyHp: Int) {
        self.enemyName = enemyName
        self.enemyHp = enemyHp
    }
    
    //method attack enemy, damage 15 point ke player
    func EnemyAttack(_ player: Player){
        //cek hp sementara kalau dikurangi minus jadi = 0
        let newhp = player.hp-15
        if(newhp<0){
            player.hp = 0
            //kalau sudah 0 hpnya player mati
            print("You are dead, you lose/n")
            //mulai 
            print("Play again?")
            print("Press [return] to continue: ")
            var input = readLine()
            while(input != ""){
                print("Wrong Input")
                print("Press [return] to continue: ")
                input = readLine()
            }
            Game()
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

