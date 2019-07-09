//
//  CalculatorTests.swift
//  CashRegisterTests
//
//  Created by Andrei Bouariu on 09/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import XCTest

@testable import CashRegister

class CalculatorTests: XCTestCase {

    var calculator: Calculator?
    
    override func setUp() {
    }

    override func tearDown() {
        calculator = nil
    }
    
    func testDiscount() {
        calculator = Calculator(items: [
            (Item(label: "CPU", price: 799.9), 2000), //1599800 at 3% = 47994
            (Item(label: "GPU", price: 1199.9), 10000) //11999000 at 7% = 839930
            ], stateTax: StateTax("UT", 6.85))
        guard let calculator1 = calculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(calculator1.getDiscountValue(), 887924.0, accuracy: 0.000000001)
        
        calculator = Calculator(items: [
            (Item(label: "Pencil", price: 0.99), 40000), //39600 at 10% = 3960
            (Item(label: "Ballpen", price: 2.49), 80000) //199200 at 15% = 29880
            ], stateTax: StateTax("UT", 6.85))
        guard let calculator2 = calculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(calculator2.getDiscountValue(), 33840.0, accuracy: 0.000000001)
    }

}
