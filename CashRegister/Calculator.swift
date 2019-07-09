//
//  Calculator.swift
//  CashRegister
//
//  Created by Andrei Bouariu on 09/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation

struct Calculator {
    let items: [(item: Item, quantity: Int)]
    let stateTax: StateTax

    init(items: [(Item, Int)], stateTax: StateTax) {
        self.items = items
        self.stateTax = stateTax
    }
    
    /**
     Determines the total discount value for all items.
     Returns: discount value (Double)
     */
    func getDiscountValue() -> Double {
        var totalDiscountValue = 0.0
        for item in items {
            
            var itemDiscountRate = 0.0
            
            switch item.quantity {
            case _ where item.quantity > 50000:
                itemDiscountRate = 0.15
            case _ where item.quantity > 10000:
                itemDiscountRate = 0.1
            case _ where item.quantity > 7000:
                itemDiscountRate = 0.07
            case _ where item.quantity > 5000:
                itemDiscountRate = 0.05
            case _ where item.quantity > 1000:
                itemDiscountRate = 0.03
            default:
                break
            }
            
            let itemPrice = item.item.price
            let itemQuantity = Double(item.quantity)
            let itemDiscountValue = itemPrice * itemQuantity * itemDiscountRate
            totalDiscountValue = totalDiscountValue + itemDiscountValue
        }
        return totalDiscountValue
    }
    
    /**
     Determines the total value for all items, excluding taxes.
     Returns: total value without taxes (Double)
     */
    func getTotalValueWithoutTaxes() -> Double {
        return items.reduce(0, { $0 + $1.0.price * Double($1.1) })
    }
}
