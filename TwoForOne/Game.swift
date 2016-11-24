//
//  Game.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/23/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import Foundation

class Game {
    var players: [Player]
    var player: Player?
    var intensity: Intensity
    var dice: [Die] = [Die()]
    var roll: Int = 0
    var score: Int = 0
    var drinks: Int = 0
    var turn: Int = 0
    var dieAdded: Bool = false
    
    
    init(players: [Player], intensity: Intensity) {
        self.players = players
        if !players.isEmpty {
            self.player = players[0]
        }
        self.intensity = intensity
    }
    
    func winRound() {
        //update score,drinks, and pass the die to next player
        score = roll
        drinks += 1
        turn += 1
        
        if turn < players.count - 1 {
            player = players[turn]
        } else {
            player = players[turn % players.count]
        }
        
    }
    
    func loseRound() -> String {
        //stop the game and return string of what player has to drink
        //save round to core data?
        return "\(player) has to drink \(drinks)!!"
    }
    
    func playAgain() {
        dice = [Die()]
        roll = 0
        score = 0
        drinks = 0
        turn = 0
        dieAdded = false
    }
    
    func addDie() {
        dice.append(Die())
    }
    
    
}
