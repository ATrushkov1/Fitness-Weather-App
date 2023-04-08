//
//  Date + Extensions.swift
//  FitnessApp
//
//  Created by Алексей Трушков on 09.03.2023.
//

import Foundation

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
}

