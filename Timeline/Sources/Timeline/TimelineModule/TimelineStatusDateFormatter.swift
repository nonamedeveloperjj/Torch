//
//  TimelineStatusDateFormatter.swift
//  
//
//  Created by John Snow on 11/04/2023.
//

import Foundation

// sourcery: AutoMockable
protocol TimelineStatusDateFormatterProtocol {
    func format(date: Date) -> String
}

struct TimelineStatusDateFormatter: TimelineStatusDateFormatterProtocol {
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    func format(date: Date) -> String {
        let dateDiff = calendar.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: date,
            to: Date()
        )
        
        let containsMinutes = dateDiff.minute != nil && dateDiff.minute != 0
        let containsHours = dateDiff.hour != nil && dateDiff.hour != 0
        let containsLessThanAWeek = (dateDiff.day ?? 0) < 7 && (dateDiff.day != 0)
        let containsMoreThatAWeek = dateDiff.day != nil && (dateDiff.day ?? 0) >= 7
        
        let dateFormat: DateFormat
        
        if containsMoreThatAWeek {
            dateFormat = .fullDate
        } else if containsLessThanAWeek {
            dateFormat = .days
        } else if containsHours {
            dateFormat = .hours
        } else if containsMinutes {
            dateFormat = .minutes
        } else {
            dateFormat = .seconds
        }
        
        dateFormatter.dateFormat = dateFormat.rawValue
        let dateToShow = containsMoreThatAWeek ? date : calendar.date(from: dateDiff)
        var stringDate = dateFormatter.string(from: dateToShow ?? Date())
        
        if dateFormat != .fullDate {
            stringDate.append(dateFormat.rawValue.lowercased())
        }
        
        return stringDate
    }
}

extension TimelineStatusDateFormatter {
    enum DateFormat: String {
        case seconds = "s"
        case minutes = "m"
        case hours = "H"
        case days = "d"
        case fullDate = "dd.MM.yyyy"
    }
}
