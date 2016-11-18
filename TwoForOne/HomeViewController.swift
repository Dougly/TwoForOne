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
    let store = PlayerDataStore.sharedInstance
    var numberOfPlayers: Int = 6
    var players: [Player] = []
    var intensity: Intensity = .light
    
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    @IBOutlet weak var playerListTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        store.fetchData()
        
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
}

extension HomeViewController: AddPlayerDelegate {
    func add(player: Player) {
        players.append(player)
    }
}

protocol AddPlayerDelegate {
    func add(player: Player)
}
