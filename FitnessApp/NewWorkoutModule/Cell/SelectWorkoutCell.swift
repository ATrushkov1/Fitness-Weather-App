//
//  SelectWorkoutCell.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 08.04.2023.
//

import UIKit

class SelectWorkoutCell: UICollectionViewCell {
    
    static let idSelectWorkoutCell = "idSelectWorkoutCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "testWorkout")?.withRenderingMode(.alwaysTemplate) // меняем стандартный цвет картинки на tintcolor
        imageView.tintColor = .specialDarkGreen
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .specialBrown
        
        addSubview(imageView)
        setConstrants()
    }
    
    //MARK: - Methods
    func configure(nameImage: String) {
        imageView.image = UIImage(named: nameImage)?.withRenderingMode(.alwaysTemplate)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - setConstrants
extension SelectWorkoutCell {
    private func setConstrants() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
