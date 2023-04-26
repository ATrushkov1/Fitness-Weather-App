//
//  UIViewController + Extensions.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 26.04.2023.
//

import UIKit

extension UIViewController {
    // создаем алерт
    func presentSimpleAlert(title: String, message: String?) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true) // вызываем алерт
    }
}
