//
//  SelectorWorkoutCollectionView.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 08.04.2023.
//

import UIKit

protocol ImageSelectProtocol: AnyObject {
    func selectImage(nameImage: String)
        
}

class SelectorWorkoutCollectionView: UICollectionView {
    
    weak var imageNameDelegate: ImageSelectProtocol?
    
    private var imageNamesArray = ["imageCell", "imageCell2", "imageCell3", "imageCell4", "testWorkout"]
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        configure()
        setupLayout()
        delegate()
        
        register(SelectWorkoutCell.self, forCellWithReuseIdentifier: SelectWorkoutCell.idSelectWorkoutCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func delegate() {
        delegate = self
        dataSource = self
    }
    
    private func configure() {
        backgroundColor = .none
    }
    
    private func setupLayout() {
        collectionLayout.minimumInteritemSpacing = 3
        collectionLayout.scrollDirection = .horizontal
    }
}

extension SelectorWorkoutCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageNamesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectWorkoutCell.idSelectWorkoutCell, for: indexPath) as? SelectWorkoutCell else {
            return UICollectionViewCell()}
        
        let nameImage = imageNamesArray[indexPath.row]
        cell.configure(nameImage: nameImage)
        return cell
    }
}

extension SelectorWorkoutCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.height)
    }
}

extension SelectorWorkoutCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageNameDelegate?.selectImage(nameImage: imageNamesArray[indexPath.row])
    }
}
