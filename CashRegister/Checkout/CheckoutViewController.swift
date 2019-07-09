//
//  CheckoutViewController.swift
//  Exercise
//
//  Created by Andrei Bouariu on 08/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import UIKit

class CheckoutViewController: UIViewController {
    
    var items: [(Item, Int)]!
    var stateTax: StateTax!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }    
}

/// Extension for table view
extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return items.count
        case 1:
            return 3
        default:
            return 1
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calculator = Calculator(items: items, stateTax: stateTax)
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "checkoutCell", for: indexPath) as! CheckoutCell
            let checkoutViewModel = CheckoutViewModel(item: items[indexPath.row].0, quantity: items[indexPath.row].1)
            checkoutViewModel.configure(cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            var calculatorViewModel: CalculatorViewModel?
            switch indexPath.row {
            case 0:
                calculatorViewModel = CalculatorViewModel(label: "Total without taxes", calculator: calculator, resolver: calculator.getTotalValueWithoutTaxes)
            case 1:
                calculatorViewModel = CalculatorViewModel(label: "Discount X%", calculator: calculator, resolver: calculator.getDiscountValue)
            case 2:
                calculatorViewModel = CalculatorViewModel(label: "Tax Y%", calculator: calculator, resolver: calculator.getTaxesValue)
            default:
                break
            }
            calculatorViewModel?.configure(cell)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let calculatorViewModel = CalculatorViewModel(label: "Total price", calculator: calculator, resolver: calculator.getTotal)
            calculatorViewModel.configure(cell)
            return cell
        default:
            fatalError("Out of sections")
        }
    }
}
