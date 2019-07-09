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

    var aCalculator: Calculator?
    var anotherCalculator: Calculator?
    
    override func setUp() {
        aCalculator = Calculator(items: [
            (Item(label: "CPU", price: 799.9), 2000), //1599800 at 3% = 47994
            (Item(label: "GPU", price: 1199.9), 10000) //11999000 at 7% = 839930
            ], stateTax: StateTax("UT", 6.85))
        
        anotherCalculator = Calculator(items: [
            (Item(label: "Pencil", price: 0.99), 40000), //39600 at 10% = 3960
            (Item(label: "Ballpen", price: 2.49), 80000) //199200 at 15% = 29880
            ], stateTax: StateTax("CA", 8.25))
    }

    override func tearDown() {
        aCalculator = nil
        anotherCalculator = nil
    }
    
    func testItemsDiscount() {
        guard let aCalculator = aCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(aCalculator.getDiscountValue(), 887924.0, accuracy: 0.000000001)
        
        guard let anotherCalculator = anotherCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(anotherCalculator.getDiscountValue(), 33840.0, accuracy: 0.000000001)
    }
    
    func testItemsValueWithoutTaxes() {
        guard let aCalculator = aCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(aCalculator.getTotalValueWithoutTaxes(), 13598800.0, accuracy: 0.000000001)
        
        guard let anotherCalculator = anotherCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(anotherCalculator.getTotalValueWithoutTaxes(), 238800.0, accuracy: 0.000000001)
    }
    
    func testItemsTaxValue() {
        guard let aCalculator = aCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(aCalculator.getTaxesValue(), 931517.8, accuracy: 0.000000001)
        
        guard let anotherCalculator = anotherCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(anotherCalculator.getTaxesValue(), 19701.0, accuracy: 0.000000001)
    }
    
    func testItemsTotalValue() {
        guard let aCalculator = aCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(aCalculator.getTotal(), 13642393.8, accuracy: 0.000000001)
        
        guard let anotherCalculator = anotherCalculator else {
            XCTFail()
            return
        }
        XCTAssertEqual(anotherCalculator.getTotal(), 224661.0, accuracy: 0.000000001)
    }

}
