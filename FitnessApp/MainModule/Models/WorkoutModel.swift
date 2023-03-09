//
//  WorkoutModel.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 09.03.2023.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknow"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0
    @Persisted var workoutImage: Data?
    @Persisted var workoutStatus: Bool = false
}
