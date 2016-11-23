//
//  PlayersViewController.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/16/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import UIKit
import CoreData

class PlayersViewController: UIViewController {
    let store = DataStore.sharedInstance
    var delegate: AddPlayerDelegate?
    @IBOutlet weak var playersTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "createPlayerSegue" {
            let destVC = segue.destination as! AddPlayerViewController
            destVC.delegate = self
        }
    }
}


//MARK: save player delegate
protocol SavePlayerDelegate {
    func savePlayer(name: String)
}

extension PlayersViewController: SavePlayerDelegate {
    
    func savePlayer(name: String) {
        let context = store.persistentContainer.viewContext
        let player = Player(context: context)
        player.name = name
        player.bestRoll = "0"
        player.mostDrinks = "0"
        store.saveContext()
        store.players.append(player)
        playersTableView.reloadData()
    }
}


//MARK: table view datasource and delegate
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: "playerCell")
        
        if let name = store.players[indexPath.row].name {
            cell?.textLabel?.text = name
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = playersTableView.cellForRow(at: indexPath)
        let rightDetailLabel = selectedCell?.detailTextLabel?.text
        
        if rightDetailLabel == " " {
            selectedCell?.detailTextLabel?.text = "O"
            delegate?.add(player: store.players[indexPath.row])
        } else if rightDetailLabel == "O" {
            selectedCell?.detailTextLabel?.text = " "
            delegate?.remove(player: store.players[indexPath.row])
        }
    }
}



