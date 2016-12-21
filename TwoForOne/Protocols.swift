//
//  Protocols.swift
//  TwoForOne
//
//  Created by Douglas Galante on 12/20/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import Foundation


protocol SavePlayerDelegate {
    func savePlayer(name: String)
}

protocol AddPlayerDelegate {
    func add(player: Player)
    func remove(player: Player)
}
