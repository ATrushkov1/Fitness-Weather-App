//
//  ViewController.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 06.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private let userPhotoImage: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .specialGray
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.borderWidth = 5
        image.layer.cornerRadius = 50
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Your Name"
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.font = .robotoBold24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(userPhotoImage)
        view.addSubview(userNameLabel)
    }
    
}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            userPhotoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userPhotoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userPhotoImage.heightAnchor.constraint(equalToConstant: 100),
            userPhotoImage.widthAnchor.constraint(equalToConstant: 100),
            
            userNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            userNameLabel.leadingAnchor.constraint(equalTo: userPhotoImage.trailingAnchor, constant: 5),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}

