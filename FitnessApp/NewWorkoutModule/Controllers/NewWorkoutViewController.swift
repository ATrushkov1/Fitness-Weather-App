//
//  NewWorkoutViewController.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 09.03.2023.
//

import UIKit

class NewWorkoutViewController: UIViewController {
    
    private let newWorkoutLabel = UILabel(text: "NEW WORKOUT",
                                          font: .robotoMedium24(),
                                          textColor: .specialGray)
    private lazy var closeButton = CloseButton(type: .system)
    
    private let nameView = NameView()
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()

    private lazy var saveButton = GreenButton(text: "SAVE")
    
    private let selectorWorkoutCollectionView = SelectorWorkoutCollectionView()

    private var stackView = UIStackView()
    
    private var workoutModel = WorkoutModel()
    private var nameImageWorkout = "testWorkout"
    

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addGesture()
        setConstraints()
    }
    
    //MARK: - Methods
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        selectorWorkoutCollectionView.imageNameDelegate = self
        stackView = UIStackView(arrangedSubviews: [nameView,
                                                   selectorWorkoutCollectionView,
                                                   dateAndRepeatView,
                                                   repsOrTimerView],
                                axis: .vertical,
                                spacing: 20)
        view.addSubview(stackView)
  
        view.addSubview(saveButton)
        saveButton.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
//        print(workoutModel)
//        RealmManager.shared.saveWorkoutModel(workoutModel)
    }
    
    private func setModel() {
        workoutModel.workoutName = nameView.getNameTextFieldText()
        
        workoutModel.workoutDate = dateAndRepeatView.getDateAndRepeat().date
        workoutModel.workoutRepeat = dateAndRepeatView.getDateAndRepeat().isRepeat
        workoutModel.workoutNumberOfDay = dateAndRepeatView.getDateAndRepeat().date.getWeekdayNumber()
        
        workoutModel.workoutSets = repsOrTimerView.sets
        workoutModel.workoutReps = repsOrTimerView.reps
        workoutModel.workoutTimer = repsOrTimerView.timer
        
        workoutModel.workoutImage = nameImageWorkout
    }
    
    private func saveModel() {
        let text = nameView.getNameTextFieldText()
        let count = text.filter { $0.isNumber || $0.isLetter }.count

        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(workoutModel)
            presentSimpleAlert(title: "Success", message: nil)
            workoutModel = WorkoutModel()
//            print(workoutModel)
            resetValue()
        } else {
            presentSimpleAlert(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func resetValue() {
        nameView.deleteTextFieldText()
        dateAndRepeatView.resetDataAndRepeat()
        repsOrTimerView.resetSliderViewValues()
    }
    
    private func addGesture() {
        
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(hideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

extension NewWorkoutViewController: ImageSelectProtocol {
    func selectImage(nameImage: String) {
        nameImageWorkout = nameImage
    }
}

//MARK: - setConstraints
extension NewWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            nameView.heightAnchor.constraint(equalToConstant: 60),
            selectorWorkoutCollectionView.heightAnchor.constraint(equalToConstant: 80),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 115),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 340),

            stackView.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            saveButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
