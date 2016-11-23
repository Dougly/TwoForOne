//
//  Game.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/23/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import Foundation

class Game {
    var players: [String]
    var intensity: Intensity
    var dice: [Die] = [Die()]
    var roll: Int = 0
    var score: Int = 0
    var drinks: Int = 0
    var turn: Int = 0
    var dieAdded: Bool = false
    
    
    init(players: [String], intensity: Intensity) {
        self.players = players
        self.intensity = intensity
    }
    
    func winRound() {
        
    }
    
    func loseRound() {
        
    }
    
    func resetBoard() {
        
    }
    
    func askPlayerToAddDie() {
        
    }
    
    
}
