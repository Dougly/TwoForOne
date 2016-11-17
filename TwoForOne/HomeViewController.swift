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

    var numberOfPlayers: Int = 6
    var playerList: [String] = ["Player 1", "Player 2", "Player 3", "Player 4", "Player 5", "Player 6"]
    var intensity: Intensity = .light
    
    @IBOutlet weak var numberOfPlayersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    @IBAction func numberOfPlayersSlider(_ sender: UISlider) {
        var newArray: [String] = []
        numberOfPlayersLabel.text = String(Int(sender.value))
        for i in 1...Int(sender.value) {
            newArray.append("Player \(i)")
        }
        playerList = newArray
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

