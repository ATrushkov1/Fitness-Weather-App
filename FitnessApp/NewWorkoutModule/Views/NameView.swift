//
//  NameView.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 09.03.2023.
//

import UIKit

class NameView: UIView {
    
    private let nameLabel = UILabel(text: "Name")
    private let nameTextField = BrownTextField()
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - Mathods
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(nameLabel)
        addSubview(nameTextField)
    }
    
    public func getNameTextFieldText() -> String {
        guard let text = nameTextField.text else { return "" }
        return text
    }
}

//MARK: - setConstraints()

extension NameView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
