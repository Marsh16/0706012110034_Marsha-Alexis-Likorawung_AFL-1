//
//  ProtocolPlayer.swift
//  0706012110034_Marsha Alexis Likorawung_AFL 1
//
//  Created by Marsha Likorawung  on 04/04/23.
//

import Foundation

protocol ProtocolPlayer{
    
    func Meteor(_ enemy: Enemy)-> Int
    
    func Shield(_ enemy: Enemy)
    
    func PhysicalAttack(_ enemy: Enemy) -> Int
    
    func UseElixer()
    
    func UsePotion()
    
    func enemyVitalScreen(_ enemy: Enemy)
    
    func Afterlosing()
}

