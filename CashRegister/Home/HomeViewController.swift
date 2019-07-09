//
//  ViewController.swift
//  Exercise
//
//  Created by Andrei Bouariu on 08/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var pickerViewBottomConstraint: NSLayoutConstraint!
    
    var selectedState: StateTax?
    
    var items: [(Item, Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func stateButtonTouched(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25) {
            self.pickerViewBottomConstraint.constant = 0;
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func addItemButtonTouched(_ sender: UIButton) {
        guard let itemsViewController = storyboard?.instantiateViewController(withIdentifier: "ItemsViewController") as? ItemsViewController else {
            return
        }
        itemsViewController.completion = { (item, quantity) in
            self.items.append((item, quantity))
            self.tableView.reloadData()
        }
        present(itemsViewController, animated: true, completion: nil)
    }
    
    @IBAction func checkoutButtonTouched(_ sender: UIButton) {
        if items.count == 0 {
            showAlert(title: "No items", message: "Please add an item.")
            return
        }
        guard let selectedState = selectedState else {
            showAlert(title: "Invalid state", message: "Please select a state.")
            return
        }
        guard let checkoutViewController = storyboard?.instantiateViewController(withIdentifier: "CheckoutViewController") as? CheckoutViewController else {
            return
        }
        checkoutViewController.items = items
        checkoutViewController.stateTax = selectedState
        present(checkoutViewController, animated: true, completion: nil)
    }
}

/// Extension for table view
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let itemViewModel = ItemViewModel(item: items[indexPath.row].0, quantity: items[indexPath.row].1)
        itemViewModel.configure(cell)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
}

/// Extension for picker view
extension HomeViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let stateTax = States.taxes[row]
        return "\(stateTax.state) - \(stateTax.tax)%"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return States.taxes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedState = States.taxes[row]
        stateButton.setTitle(selectedState?.state, for: .normal)
        UIView.animate(withDuration: 0.25) {
            self.pickerViewBottomConstraint.constant = -216
            self.view.layoutIfNeeded()
        }
    }
}
