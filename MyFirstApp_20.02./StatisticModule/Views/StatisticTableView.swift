//
//  StatisticTableView.swift
//  MyFirstApp_20.02.
//
//  Created by Трушков Алексей on 31.05.2023.
//

import UIKit

class StatisticTableView: UITableView {
    
    private let idStatisticTableViewCell = "idStatisticTableViewCell"
    
    private var differenceArray = [DifferenceWorkout]()
 
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        configure()
        setDelegates()
        register(StatisticTableViewCell.self, forCellReuseIdentifier: idStatisticTableViewCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        separatorStyle = .none
        bounces = false
        showsVerticalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    public func setDifferenceArray(array: [DifferenceWorkout]) {
        differenceArray = array
    }
}

// MARK: - UITableViewDataSource

extension StatisticTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        differenceArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idStatisticTableViewCell,
                                                       for: indexPath) as? StatisticTableViewCell else {
            return UITableViewCell()
        }
        let model = differenceArray[indexPath.row]
        cell.configure(differenceWorkout: model)
        return cell
    }
}

//MARK: - UITableViewDelegate

extension StatisticTableView: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        55
    }
}

