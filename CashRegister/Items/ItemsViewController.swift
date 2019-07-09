//
//  ItemsViewController.swift
//  Exercise
//
//  Created by Andrei Bouariu on 08/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {
    
    @IBOutlet var labelTextField: UITextField!
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var quantityTextField: UITextField!
    
    var completion: ((Item, Int) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func cancelButtonTouched(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTouched(_ sender: UIButton) {
        guard let labelText = labelTextField.text, labelText.isEmpty == false else {
            showAlert(title: "Missing label", message: "Please type a label.")
            return
        }
        guard let quantityText = quantityTextField.text, quantityText.isEmpty == false, let quantity = Int(quantityText) else {
            showAlert(title: "Invalid quantity", message: "Please type a valid quantity (integer).")
            return
        }
        guard let priceText = priceTextField.text?.replacingOccurrences(of: ",", with: "."), priceText.isEmpty == false, let price = Double(priceText) else {
            showAlert(title: "Invalid price", message: "Please type a valid price.")
            return
        }
        if let completion = completion {
            let item = Item(label: labelText, price: price)
            completion(item, quantity)
            dismiss(animated: true, completion: nil)
        }
    }
    
}
