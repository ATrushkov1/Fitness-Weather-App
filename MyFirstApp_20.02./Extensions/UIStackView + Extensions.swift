//
//  UIStackView + Extensions.swift
//  MyFirstApp_20.02.
//
//  Created by Сергей Горбачёв on 24.02.2023.
//

import UIKit
/*
 let stackView = UIStackView()
 
 stackView.addArrangedSubviews(YourView)
 stackView.addArrangedSubviews(YourView)
 stackView.addArrangedSubviews(YourView)
 stackView.addArrangedSubviews(YourView)
 
 stackView.axis = .horizontal
 stackView.spacing = 10
 stackView.translatesAutoresizingMaskIntoConstraints = false
 */

extension UIStackView {
    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
