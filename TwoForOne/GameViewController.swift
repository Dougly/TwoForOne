//
//  GameViewController.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/9/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var game: Game?
    var unwrappedGame = Game(players: [], intensity: .light)
    var players: [String] = []
    
    @IBOutlet weak var rollsCollectionView: UICollectionView!
    @IBOutlet weak var drinksLabel: UILabel!
    @IBOutlet weak var rollToBeatLabel: UILabel!
    @IBOutlet weak var addDieView: UIView!
    @IBOutlet weak var currentPlayer: UILabel!
    @IBOutlet weak var rollStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let game = game {
            unwrappedGame = game
        }
        for player in unwrappedGame.players {
            players.append(player.name!)
        }
        rollsCollectionView.delegate = self
        rollsCollectionView.dataSource = self
        addDieView.isHidden = true
    }
    
    func printGameDescription() {
        print("\ngame: \(unwrappedGame)\nplayers: \(players)\nscore: \(unwrappedGame.score)\ndrinks: \(unwrappedGame.drinks)\nturn: \(unwrappedGame.player!.name!)")
    }
    
    @IBAction func rollDie(_ sender: UIButton) {
        if unwrappedGame.dieAdded {
            unwrappedGame.rollAddedDie()
            let message = unwrappedGame.checkScore { (success) in }
            print(message)
        } else {
            unwrappedGame.takeTurn()
            let _ = unwrappedGame.checkScore { (success) in
                addDieView.isHidden = false
            }
        }
        printGameDescription()
        updateBoard()
    }
    
    @IBAction func addDie(_ sender: UIButton) {
        unwrappedGame.addDie()
        
    }
    
    
    @IBAction func drink(_ sender: UIButton) {
        unwrappedGame.playAgain()
        updateBoard()
    }
    
    func updateBoard() {
        rollToBeatLabel.text = String(unwrappedGame.score)
        drinksLabel.text = String(unwrappedGame.drinks)
        rollsCollectionView.reloadData()
    }
    
    func resetBoard() {
        unwrappedGame.playAgain()
        updateBoard()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return unwrappedGame.dice.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "die", for: indexPath) as! DieCell
        
        cell.numberLabel.text = String(unwrappedGame.dice[indexPath.item].value)
        
        return cell
    }
    
}

//Custom Cell
class DieCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
}






