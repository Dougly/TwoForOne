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
    
    func takeTurn() {
        for die in dice {
            die.rollDie()
        }
        roll = dice.reduce(0) { result, die -> Int in
            return result + die.value
        }
        print(checkScore { success in })
    }
    
    func addDie() {
        dice.append(Die())
        dieAdded = true
    }
    
    func rollAddedDie() {
        if let addedDie = dice.last {
            addedDie.rollDie()
            let newRoll = addedDie.value
            score += newRoll
        }
    }
    
    func checkScore(completion: (Bool) -> ()) -> String {
        if !dieAdded && roll > score || dieAdded && roll > score   {
            return winRound()
        } else if !dieAdded && roll < score {
            completion(true)
            return("do you want to add a die to double the drink wager or drink?")
        }else if turn == 1 {
            return "end of first turn"
        } else {
            return loseRound()
        }
    }
    
    func winRound() -> String {
        //update score,drinks, and pass the die to next player
        var message = "\(player!.name!) won the round! "
        score = roll
        drinks += 1
        turn += 1
        
        if turn < players.count - 1 {
            player = players[turn]
        } else {
            player = players[turn % players.count]
        }
        message.append("Pass the die to \(player!.name!)")
        return message
    }
    
    func loseRound() -> String {
        //stop the game and return string of what player has to drink
        //save round to core data?
        
        return "\(player!.name!) has to drink \(drinks)!!"
    }
    
    func playAgain() {
        dice = [Die()]
        roll = 0
        score = 0
        drinks = 0
        turn = 0
        dieAdded = false
    }
    
}
