//
//  File.swift
//  
//
//  Created by John Snow on 13/04/2023.
//

import XCTest
@testable import Timeline

final class TimelineRowModelsDirectorTests: XCTestCase {
    private var director: TimelineRowModelsDirector!
    private var builderMock: TimelineRowModelsBuilderProtocolMock!
    
    override func setUp() {
        super.setUp()
        builderMock = TimelineRowModelsBuilderProtocolMock()
        director = TimelineRowModelsDirector(rowsBuilder: builderMock)
    }
    
    override func tearDown() {
        builderMock = nil
        director = nil
        super.tearDown()
    }
    
    func testThatDirectorConstructsValidModels() {
        // given
        let statuses = [Status.stubData, Status.emptyContentStatus]
        builderMock.constructIdReturnValue = TestData.containerViewModel
        
        // when
        _ = director.constructRowModels(from: statuses)
        
        // then
        XCTAssertEqual(builderMock.buildHeaderComponentFromCallsCount, statuses.count)
        XCTAssertEqual(builderMock.buildTextComponentFromCallsCount, 1)
        XCTAssertEqual(builderMock.buildTextComponentFromReceivedText, statuses.first!.content)
        XCTAssertEqual(builderMock.buildFooterComponentFromCallsCount, statuses.count)
        XCTAssertEqual(builderMock.constructIdCallsCount, statuses.count)
    }
}

private extension TimelineRowModelsDirectorTests {
    enum TestData {
        static let containerViewModel = TimelineStatusContainerView.Model(
            id: "id",
            headerModel: .stubData,
            textModel: .stubData,
            footerModel: .stubData
        )
    }
}
