//
//  UIView + Extensions.swift
//  MyFirstApp_20.02.
//
//  Created by Сергей Горбачёв on 22.02.2023.
//

import UIKit

extension UIView {
    
    func addShadowOnView() {
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 1.0
    }
}
