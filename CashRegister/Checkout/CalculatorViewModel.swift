//
//  CalculatorViewModel.swift
//  Exercise
//
//  Created by Andrei Bouariu on 7/9/19.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorViewModel {
    fileprivate let label: String
    fileprivate let calculator: Calculator
    fileprivate let resolver: (() -> Any)
    
    public init(label: String, calculator: Calculator, resolver: @escaping (() -> Any)) {
        self.label = label
        self.calculator = calculator
        self.resolver = resolver
    }    
}

extension CalculatorViewModel {
    public func configure(_ tableViewCell: UITableViewCell) {
        tableViewCell.textLabel?.text = label
        if let doubleValue = resolver() as? Double {
            tableViewCell.detailTextLabel?.text = String(format: "%.2f", doubleValue)
        }
        if let intValue = resolver() as? Int {
            tableViewCell.detailTextLabel?.text = String(intValue)
        }
    }
}

