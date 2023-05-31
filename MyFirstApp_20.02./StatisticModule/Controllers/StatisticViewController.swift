//
//  StatisticViewController.swift
//  MyFirstApp_20.02.
//
//  Created by Трушков Алексей on 31.05.2023.
//

import UIKit

class StatisticViewController: UIViewController {

    private let statisticLabel: UILabel = {
       let label = UILabel()
        label.text = "STATISTIC"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
       let segmentedControl = UISegmentedControl(items: ["Week", "Month"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = .specialGreen
        segmentedControl.selectedSegmentTintColor = .specialYellow
        let font = UIFont(name: "Roboto-Medium", size: 16)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor : UIColor.white], for: .normal)
        segmentedControl.setTitleTextAttributes([.font : font as Any,
                                                 .foregroundColor: UIColor.specialGray], for: .selected)
        segmentedControl.addTarget(self, action: #selector(segmentedChange), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        return segmentedControl
    }()
    
    private let nameTextField = BrownTextField()

    private let tableView = StatisticTableView()
    private let exercisesLabel = UILabel(text: "Exercises")
    
    private var workoutArray = [WorkoutModel]()
    private var differenceArray = [DifferenceWorkout]()
    private var filtredArray = [DifferenceWorkout]()
    
    private var isFiltred = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setStartScreen()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraints()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground

        view.addSubview(statisticLabel)
        view.addSubview(exercisesLabel)
        view.addSubview(tableView)
        view.addSubview(segmentedControl)
        nameTextField.brownDelegate = self
        view.addSubview(nameTextField)
    }
    
    @objc private func segmentedChange() {
        let dateToday = Date()
        differenceArray = [DifferenceWorkout]()
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let dateStart = dateToday.offsetDay(day: 7)
            getDifferenceModel(dateStart: dateStart)
        } else {
            let dateStart = dateToday.offsetMonth(month: 1)
            getDifferenceModel(dateStart: dateStart)
        }
        tableView.reloadData()
    }
    
    private func getWorkoutsName() -> [String] {
        var nameArray = [String]()
        
        let allWorkouts = RealmManager.shared.getResultWorkoutModel()
        
        for workoutModel in allWorkouts {
            if !nameArray.contains(workoutModel.workoutName) {
                nameArray.append(workoutModel.workoutName)
            }
        }
        return nameArray
    }
    
    private func getDifferenceModel(dateStart: Date) {
        let dateEnd = Date()
        let nameArray = getWorkoutsName()
        let allWorkouts = RealmManager.shared.getResultWorkoutModel()
        
        for name in nameArray {
            let predicateDifference = NSPredicate(format: "workoutName = '\(name)' AND workoutDate BETWEEN %@", [dateStart, dateEnd])
            let filtredArray = allWorkouts.filter(predicateDifference).sorted(byKeyPath: "workoutDate")
            workoutArray = filtredArray.map { $0 }
            
            guard let last = workoutArray.last?.workoutReps,
                  let first = workoutArray.first?.workoutReps else {
                return
            }
            let differenceWorkout = DifferenceWorkout(name: name, lastReps: last, firstReps: first)
            differenceArray.append(differenceWorkout)
        }
        tableView.setDifferenceArray(array: differenceArray)
    }
    
    private func setStartScreen() {
        let dateToday = Date()
        differenceArray = [DifferenceWorkout]()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        tableView.reloadData()
    }
    
    private func filtringWorkouts(text: String) {
        
        for workout in differenceArray {
            if workout.name.lowercased().contains(text.lowercased()) {
                filtredArray.append(workout)
            }
        }
    }
}

//MARK: - BrownTextFieldProtocol

extension StatisticViewController: BrownTextFieldProtocol {
    func typing(range: NSRange, replacementString: String) {
        if let text = nameTextField.text,
           let textRang = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRang, with: replacementString)
           
            filtredArray = [DifferenceWorkout]()
            isFiltred = updatedText.count > 0
            filtringWorkouts(text: updatedText)
        }
        
        if isFiltred {
            tableView.setDifferenceArray(array: filtredArray)
        } else {
            tableView.setDifferenceArray(array: differenceArray)
        }
        tableView.reloadData()
    }

    func clear() {
        isFiltred = false
        differenceArray = [DifferenceWorkout]()
        let dateToday = Date().localDate()
        getDifferenceModel(dateStart: dateToday.offsetDay(day: 7))
        tableView.reloadData()
    }
}

//MARK: - Set Constraints

extension StatisticViewController {

    private func setConstraints() {

        NSLayoutConstraint.activate([
            statisticLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            statisticLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            segmentedControl.topAnchor.constraint(equalTo: statisticLabel.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            nameTextField.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38),
            
            exercisesLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 10),
            exercisesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            exercisesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tableView.topAnchor.constraint(equalTo: exercisesLabel.bottomAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}
