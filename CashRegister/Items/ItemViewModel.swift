//
//  ItemViewModel.swift
//  Exercise
//
//  Created by Andrei Bouariu on 08/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation
import UIKit

struct ItemViewModel {
    fileprivate let item: Item
    fileprivate let quantity: Int
    
    public init(item: Item, quantity: Int) {
        self.item = item
        self.quantity = quantity
    }    
}

extension ItemViewModel {
    public func configure(_ tableViewCell: UITableViewCell) {
        tableViewCell.textLabel?.text = "\(quantity) x \(item.label)"
        tableViewCell.detailTextLabel?.text = String(item.price)
    }
}
