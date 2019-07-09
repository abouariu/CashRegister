//
//  CashRegisterUITests.swift
//  CashRegisterUITests
//
//  Created by Andrei Bouariu on 09/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import XCTest

class CashRegisterUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
    }

    func testResult() {
        
        let app = XCUIApplication()
        let addItemButton = app.buttons["Add Item"]
        addItemButton.tap()
        
        let labelTextField = app.textFields["Label"]
        labelTextField.tap()
        labelTextField.typeText("Pencil")
        
        let quantityTextField = app.textFields["Quantity"]
        quantityTextField.tap()
        quantityTextField.typeText("40000")
        
        let priceTextField = app.textFields["Price"]
        priceTextField.tap()
        priceTextField.typeText("0.99")
        
        let doneButton = app.buttons["Done"]
        doneButton.tap()
        addItemButton.tap()
        
        labelTextField.tap()
        labelTextField.typeText("Ballpen")
        
        quantityTextField.tap()
        quantityTextField.typeText("80000")
        
        priceTextField.tap()
        priceTextField.typeText("2.49")
        
        doneButton.tap()
        
        app.buttons["Select state"].tap()
        app.pickerWheels.element.adjust(toPickerWheelValue: "CA - 8.25%")
        app.buttons["Checkout"].tap()
        
        let table = app.tables.matching(identifier: "checkoutTableView")
        XCTAssertEqual(table.cells.count, 6) // 2 items, 3 breakdowns, 1 total        
    }
}
