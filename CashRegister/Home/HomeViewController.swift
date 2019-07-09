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
    
    var items: [(Item, Int)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func stateButtonTouched(_ sender: UIButton) {
        
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
        guard let checkoutViewController = storyboard?.instantiateViewController(withIdentifier: "CheckoutViewController") as? CheckoutViewController else {
            return
        }
        present(checkoutViewController, animated: true, completion: nil)
    }
}
