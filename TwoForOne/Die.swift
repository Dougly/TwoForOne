//
//  Die.swift
//  TwoForOne
//
//  Created by Douglas Galante on 11/16/16.
//  Copyright © 2016 Douglas Galante. All rights reserved.
//

import Foundation

class Die {
    var value: Int = 0
    
    func rollDie() {
        let randomNum = Int(arc4random_uniform(6) + 1)
        value = randomNum
    }
}
