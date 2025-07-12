//
//  Date + Extensions.swift
//  ZuperServices
//
//  Created by Ligen Raj on 12/07/25.
//

import Foundation

extension Date {
    
    var formattedDate: String {
        let calendar = Calendar.current
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .none
        formatter.locale = Locale(identifier: "en_US_POSIX") // for AM/PM
        
        if calendar.isDateInToday(self) {
            return "Today, \(formatter.string(from: self))"
        } else if calendar.isDateInTomorrow(self) {
            return "Tomorrow, \(formatter.string(from: self))"
        } else if calendar.isDateInYesterday(self) {
            return "Yesterday, \(formatter.string(from: self))"
        } else {
            formatter.dateFormat = "dd/MM/yyyy, h:mm a"
            return formatter.string(from: self)
        }
    }
    
}
