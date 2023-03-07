//
//  StatistikViewController.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 07.03.2023.
//

import UIKit

class StatisticViewController: UIViewController {
    
    private let statisticsLabel: UILabel = {
       let label = UILabel()
        label.text = "STATISTICS"
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.font = .robotoBold24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let exercisesLabel = UILabel(text: "Exercises")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(statisticsLabel)
        view.addSubview(exercisesLabel)
    }
}

extension StatisticViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            statisticsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            statisticsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            exercisesLabel.topAnchor.constraint(equalTo: statisticsLabel.bottomAnchor, constant: 85),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
