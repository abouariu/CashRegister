//
//  StateTax.swift
//  CashRegister
//
//  Created by Andrei Bouariu on 09/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation

struct StateTax {
    let state: String
    let tax: Double
    
    init(_ state: String, _ tax: Double) {
        self.state = state
        self.tax = tax
    }
}
