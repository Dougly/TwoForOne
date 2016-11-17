//
//  GameViewController.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/9/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import UIKit

class GameViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var rollToBeat: Int = 0
    var numOfDrinks: Int = 0
    var rolls: [Int] = []
    var players: [String] = []
    var intensity: Intensity = .heavy
    var addedDieThisTurn = false
    var turnCount = 1
    
    @IBOutlet weak var rollsCollectionView: UICollectionView!
    @IBOutlet weak var drinksLabel: UILabel!
    @IBOutlet weak var rollToBeatLabel: UILabel!
    @IBOutlet weak var addDieView: UIView!
    @IBOutlet weak var currentPlayer: UILabel!
    @IBOutlet weak var rollStatusLabel: UILabel!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        rollsCollectionView.delegate = self
        rollsCollectionView.dataSource = self
        addDieView.isHidden = true
    }
    
    @IBAction func rollDie(_ sender: UIButton) {
        if rolls.isEmpty {
            rolls.append(Int(arc4random_uniform(6))+1)
            numOfDrinks += 1
            rollToBeat = rolls[0]
            updateBoard()
            return
        }
        
        if !addedDieThisTurn {
            rolls = rolls.map { previousRoll -> Int in
                return (Int(arc4random_uniform(6))+1)
            }
            
            let newRoll = rolls.reduce(0) { (result, nextNum) -> Int in
                return result + nextNum
            }
            
            if newRoll == rollToBeat {
                //player loses
                resetBoard()
            } else if newRoll > rollToBeat {
                rollToBeat = newRoll
                turnCount += 1
                numOfDrinks += 1
                updateBoard()
            } else if newRoll < rollToBeat {
                rollStatusLabel.text = "You rolled a \(newRoll) but needed \(rollToBeat)!"
                addDieView.isHidden = false
                updateBoard()
                //give option to add die
            }
        }
        
        if addedDieThisTurn {
            rolls.append(Int(arc4random_uniform(6))+1)
            rollsCollectionView.reloadData()
            
            let newRoll = rolls.reduce(0) { (result, nextNum) -> Int in
                return result + nextNum
            }
            
            if newRoll <= rollToBeat {
                //player loses
            } else if newRoll > rollToBeat {
                rollToBeat = newRoll
                turnCount += 1
                numOfDrinks += 1
                addedDieThisTurn = false
                updateBoard()
            }

        }
    
        
    }
    
    @IBAction func addDie(_ sender: UIButton) {
        addedDieThisTurn = true
        numOfDrinks *= 2
        addDieView.isHidden = true
        updateBoard()
    }
    
    
    @IBAction func drink(_ sender: UIButton) {
    }
    
    func playerLoses() {
        
    }
    
    
    
    func updateBoard() {
        rollToBeatLabel.text = String(rollToBeat)
        drinksLabel.text = String(numOfDrinks)
        rollsCollectionView.reloadData()

    }
    
    func resetBoard() {
        rollToBeat = 0
        numOfDrinks = 0
        rolls = []
        addedDieThisTurn = false
        turnCount = 1
        updateBoard()
    }
    
    
    //Collecton View
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rolls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "die", for: indexPath) as! DieCell
        
        cell.numberLabel.text = String(rolls[indexPath.item])
        
        
        return cell
    }
    
}

//Custom Cell
class DieCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!

    
}
