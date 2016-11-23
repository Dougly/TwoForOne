//
//  ViewController.swift
//  TwoForOne
//
//  Created by Douglas Galante on 10/27/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import UIKit

enum Intensity: String {
    case light, medium, heavy
}

class HomeViewController: UIViewController {
    let store = DataStore.sharedInstance
    var numberOfPlayers: Int = 6
    var selectedPlayers: [Player] = []
    var intensity: Intensity = .light
    @IBOutlet weak var playerListTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateListOfSelectedPlayers()
    }
    
    func updateListOfSelectedPlayers() {
        var listOfPlayers = ""
        for (index, player) in selectedPlayers.enumerated() {
            if let name = player.name {
                listOfPlayers.append("\(index + 1). \(name)\n")
            }
        }
        playerListTextField.text = listOfPlayers
    }
    
    @IBAction func intensitySegmentControl(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
        case 0:
            intensity = .light
        case 1:
            intensity = .medium
        case 2:
            intensity = .heavy
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPlayers" {
            let destVC = segue.destination as! PlayersViewController
            destVC.delegate = self
        }
    }
}

//MARK: Add Player Delegate
extension HomeViewController: AddPlayerDelegate {
    func add(player: Player) {
        selectedPlayers.append(player)
    }
    
    func remove(player: Player) {
        for (index, playerToCheck) in selectedPlayers.enumerated() {
            if player == playerToCheck {
                selectedPlayers.remove(at: index)
            }
        }
    }
}

protocol AddPlayerDelegate {
    func add(player: Player)
    func remove(player: Player)
}
