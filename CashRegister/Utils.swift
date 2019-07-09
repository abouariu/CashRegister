//
//  Utils.swift
//  Exercise
//
//  Created by Andrei Bouariu on 08/07/2019.
//  Copyright © 2019 abouariu. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
