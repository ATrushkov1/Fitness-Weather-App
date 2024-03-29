//
//  SliderView.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 09.03.2023.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    func changeValue(type: SliderType, value: Int)
}

class SliderView: UIView {
    
    weak var delegate: SliderViewProtocol?

    private let nameLabel = UILabel(text: "Name",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let numberLabel = UILabel(text: "0",
                                           font: .robotoMedium24(),
                                           textColor: .specialGray)
    
    private lazy var slider = GreenSlider()

    private var stackView = UIStackView()
    
    private var sliderType: SliderType?
    
    public var isActive: Bool = true {
        didSet {
            if self.isActive {
                nameLabel.alpha = 1
                numberLabel.alpha = 1
                slider.alpha = 1
            } else {
                nameLabel.alpha = 0.5
                numberLabel.alpha = 0.5
                slider.alpha = 0.5
                slider.value = 0
                numberLabel.text = "0"
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(name: String, minValue: Float, maxValue: Float, type: SliderType) {
        self.init(frame: .zero)
        nameLabel.text = name
        slider.minimumValue = minValue
        slider.maximumValue = maxValue
        sliderType = type

        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
 
        let labelsStackView = UIStackView(arrangedSubviews: [nameLabel, numberLabel],
                                          axis: .horizontal,
                                          spacing: 10)
        labelsStackView.distribution = .equalSpacing
        stackView = UIStackView(arrangedSubviews: [labelsStackView, slider],
                                axis: .vertical,
                                spacing: 10)
        addSubview(stackView)
    }
    
    @objc private func sliderChanged() {
        let intValueSlider = Int(slider.value)
        numberLabel.text = sliderType == .timer ? intValueSlider.getTimeFromSeconds() : "\(intValueSlider)"
        guard let type = sliderType else { return }
        delegate?.changeValue(type: type, value: intValueSlider)
    }
    
    public func resetValues() {
        numberLabel.text = "0"
        slider.value = 0
        isActive = true
    }
}

//MARK: - Set Constraints
extension SliderView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
}
 
