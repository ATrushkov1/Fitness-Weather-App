//
//  WeatherView.swift
//  MyFirstApp_20.02.
//
//  Created by Трушков Алексей on 31.05.2023.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherIconImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sun")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let weatherStatusLabel: UILabel = {
        let label = UILabel()
        label.text = "Loading..."
        label.textColor = .specialGray
        label.font = .robotoMedium18()
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDiscriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 2
        label.textColor = .specialGray
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .white
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherIconImageView)
        addSubview(weatherStatusLabel)
        addSubview(weatherDiscriptionLabel)
    }
    
    public func updateImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        weatherIconImageView.image = image
    }
    
    public func updateLabels(model: WeatherModel) {
        weatherStatusLabel.text = model.weather[0].myDescription + " \(model.main.temperatureCesius)°C"
        
        switch model.weather[0].weatherDescription {
        case "shower snow":
            weatherDiscriptionLabel.text = "Лучше остаться дома и провести домашнюю тренировку"
        default:
            weatherDiscriptionLabel.text = "No data"
        }
    }
}

extension WeatherView {

    private func setContraints() {

        NSLayoutConstraint.activate([
            weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            weatherIconImageView.trailingAnchor.constraint(equalTo: trailingAnchor,
                                                           constant: -10),
            weatherIconImageView.widthAnchor.constraint(equalToConstant: 60),
            weatherIconImageView.heightAnchor.constraint(equalToConstant: 60),
            
            weatherStatusLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherStatusLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                        constant: 10),
            weatherStatusLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor,
                                                         constant: -10),
            weatherStatusLabel.heightAnchor.constraint(equalToConstant: 20),

            weatherDiscriptionLabel.topAnchor.constraint(equalTo: weatherStatusLabel.bottomAnchor,
                                                         constant: 0),
            weatherDiscriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                             constant: 10),
            weatherDiscriptionLabel.trailingAnchor.constraint(equalTo: weatherIconImageView.leadingAnchor,
                                                              constant: -10),
            weatherDiscriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor,
                                                            constant: -5)
        ])
    }
}

