//
//  AddPlayerViewController.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/17/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import UIKit


class AddPlayerViewController: UIViewController {
    
    var delegate: SavePlayerDelegate?
    @IBOutlet weak var playerNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        delegate?.savePlayer(name: playerNameTextField.text!)
        self.dismiss(animated: true, completion: nil)
    }
}
