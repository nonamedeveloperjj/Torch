//
//  TimelineStatusDateFormatterTests.swift
//  
//
//  Created by John Snow on 13/04/2023.
//

import XCTest
@testable import Timeline

final class TimelineStatusDateFormatterTests: XCTestCase {
    private var dateFormatter: TimelineStatusDateFormatter!
    
    override func setUp() {
        super.setUp()
        dateFormatter = TimelineStatusDateFormatter()
    }
    
    override func tearDown() {
        dateFormatter = nil
        super.tearDown()
    }
    
    func testThatFormatterRepresentsSecondsCorrectly() {
        // given
        let secondsAgo = Calendar.current.date(byAdding: .second, value: -30, to: Date())!
        
        // when
        let result = dateFormatter.format(date: secondsAgo)
        
        // then
        XCTAssertTrue(result == "30s")
    }
    
    func testThatFormatterRepresentsMinutesCorrectly() {
        // given
        let minutesAgo = Calendar.current.date(byAdding: .minute, value: -4, to: Date())!
        
        // when
        let result = dateFormatter.format(date: minutesAgo)
        
        // then
        XCTAssertTrue(result == "4m")
    }
    
    func testThatFormatterRepresentsHoursCorrectly() {
        // given
        let hoursAgo = Calendar.current.date(byAdding: .hour, value: -7, to: Date())!
        
        // when
        let result = dateFormatter.format(date: hoursAgo)
        
        // then
        XCTAssertTrue(result == "7h")
    }
    
    func testThatFormatterRepresentsDaysCorrectly() {
        // given
        let daysAgo = Calendar.current.date(byAdding: .day, value: -5, to: Date())!
        
        // when
        let result = dateFormatter.format(date: daysAgo)
        
        // then
        XCTAssertTrue(result == "5d")
    }
    
    func testThatFormatterRepresentsFullDateCorrectly() {
        // given
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        let daysAgo = Calendar.current.date(byAdding: .day, value: -7, to: Date())!
        
        // when
        let result = dateFormatter.format(date: daysAgo)
        
        // then
        XCTAssertTrue(result == formatter.string(from: daysAgo))
    }
}
