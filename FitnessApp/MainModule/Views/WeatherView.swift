//
//  WeatherView.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 07.03.2023.
//

import UIKit

class WeatherView: UIView {
    
    private let sunImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "sun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let weatherLabel: UILabel = {
       let label = UILabel()
        label.text = "Солнечно"
        label.font = .robotoMedium18()
        label.textColor = .specialGray
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailsTextWeather: UILabel = {
       let label = UILabel()
        label.text = "Хорошая погода чтобы позаниматься на улице"
        label.numberOfLines = 2
        label.font = .robotoMedium12()
        label.textColor = .specialLine
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - Methods
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 10
        addShadowOnView()
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sunImage)
        addSubview(weatherLabel)
        addSubview(detailsTextWeather)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - setConstraints()

extension WeatherView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            sunImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            sunImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            sunImage.widthAnchor.constraint(equalToConstant: 60),
            sunImage.heightAnchor.constraint(equalToConstant: 60),
            
            weatherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            weatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weatherLabel.trailingAnchor.constraint(equalTo: sunImage.leadingAnchor, constant: -5),
            
            detailsTextWeather.topAnchor.constraint(equalTo: weatherLabel.bottomAnchor, constant: 5),
            detailsTextWeather.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            detailsTextWeather.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            detailsTextWeather.trailingAnchor.constraint(equalTo: sunImage.leadingAnchor, constant: -5)
        ])

    }
}
