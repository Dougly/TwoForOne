//
//  PlayersViewController.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/16/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import UIKit

class PlayersViewController: UIViewController {
    
    let store = PlayerDataStore.sharedInstance
    @IBOutlet weak var playersTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}





//MARK: SavePlayerDelegate extension
extension PlayersViewController: SavePlayerDelegate {
    
    func savePlayer(name: String) {
        //save player to core data and add to table view of players
    }
}


//MARK: table view extension
extension PlayersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playersTableView.dequeueReusableCell(withIdentifier: "playerCell")
        
        cell?.textLabel?.text = "test"
        
        return cell!
    }
    
}





protocol SavePlayerDelegate {
    func savePlayer(name: String)
    
}
