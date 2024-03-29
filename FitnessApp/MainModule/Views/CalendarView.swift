//
//  CalendarView.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 07.03.2023.
//

import UIKit

class CalendarView: UIView {
    
    private let collectionView = CalendarCollectionView()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    //MARK: - Methods
    private func setupViews() {
        backgroundColor = .specialGreen
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setDelegate(_ delegate: CalendarViewProtocol?) {
        collectionView.calendarDelegate = delegate
    }
}

//MARK: - setConstraints
extension CalendarView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 105)
        ])
    }
}
