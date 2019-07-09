//
//  Item.swift
//  CashRegister
//
//  Created by Andrei Bouariu on 09/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation

struct Item {
    public let label: String
    public let price: Double
    
    init(label: String, price: Double) {
        self.label = label
        self.price = price
    }    
}
