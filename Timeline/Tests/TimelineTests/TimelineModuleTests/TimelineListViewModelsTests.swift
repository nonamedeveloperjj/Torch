//
//  TimelineListViewModelsTests.swift
//  
//
//  Created by John Snow on 12/04/2023.
//

import XCTest
@testable import Timeline

final class TimelineListViewModelsTests: XCTestCase {
    private var timelineService: TimelineServiceProtocolMock!
    private var rowsDirector: TimelineRowModelsDirectorProtocolMock!
    private var viewModel: TimelineListViewModel!
    
    override func setUp() {
        super.setUp()
        timelineService = TimelineServiceProtocolMock()
        rowsDirector = TimelineRowModelsDirectorProtocolMock()
        viewModel = TimelineListViewModel(timelineService: timelineService, rowsDirector: rowsDirector)
    }
    
    override func tearDown() {
        super.tearDown()
        rowsDirector = nil
        timelineService = nil
        viewModel = nil
    }
    
    func testViewModelFetchesPublicTimelinesWithSuccess() async throws {
        // given
        rowsDirector.constructRowModelsFromReturnValue = [TestData.containerViewModel, TestData.containerViewModel, TestData.containerViewModel]
        timelineService.fetchPublicTimelinesReturnValue = .success(TestData.statuses)
        
        // when
        try await viewModel.fetchPublicTimelines()
        
        // then
        XCTAssertEqual(timelineService.fetchPublicTimelinesCallsCount, 1)
        XCTAssertEqual(rowsDirector.constructRowModelsFromCallsCount, 1)
        XCTAssertEqual(rowsDirector.constructRowModelsFromReceivedStatuses?.count, TestData.statuses.count)
    }
}

extension TimelineListViewModelsTests {
    enum TestData {
        static let statuses = [Status.stubData, Status.emptyContentStatus, Status.stubData]
        static let containerViewModel = TimelineStatusContainerView.Model(
            id: "id",
            headerModel: .stubData,
            textModel: .stubData,
            footerModel: .stubData
        )
    }
}
