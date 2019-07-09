//
//  CheckoutViewModel.swift
//  Exercise
//
//  Created by Andrei Bouariu on 7/9/19.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation
import UIKit

struct CheckoutViewModel {
    fileprivate let item: Item
    fileprivate let quantity: Int
    
    public init(item: Item, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }    
}

extension CheckoutViewModel {
    public func configure(_ tableViewCell: CheckoutCell) {
        tableViewCell.label.text = item.label
        tableViewCell.quantity.text = String(quantity)
        tableViewCell.price.text = String(item.price)
        tableViewCell.total.text = String(format: "%.2f", Double(quantity) * item.price)
    }
}
