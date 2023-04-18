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
        rowsDirector = nil
        timelineService = nil
        viewModel = nil
        super.tearDown()
    }
    
    func testViewModelFetchesPublicTimelinesWithSuccess() async throws {
        // given
        rowsDirector.constructRowModelsFromReturnValue = [TestData.containerViewModel, TestData.containerViewModel, TestData.containerViewModel]
        timelineService.fetchPublicTimelinesMaxIdReturnValue = .success(TestData.statuses)
        
        // when
        try await viewModel.fetchPublicTimelines()
        
        // then
        XCTAssertEqual(timelineService.fetchPublicTimelinesMaxIdCallsCount, 1)
        XCTAssertEqual(rowsDirector.constructRowModelsFromCallsCount, 1)
        XCTAssertEqual(rowsDirector.constructRowModelsFromReceivedStatuses?.count, TestData.statuses.count)
    }
    
    func testViewModelFetchesMoreStatusesWithSuccess() async throws {
        // given
        let receivedStatuses = TestData.statuses
        rowsDirector.constructRowModelsFromReturnValue = [TestData.containerViewModel, TestData.containerViewModel, TestData.containerViewModel]
        timelineService.fetchPublicTimelinesMaxIdReturnValue = .success(receivedStatuses)
        try await viewModel.fetchPublicTimelines()
        
        // when
        try await viewModel.fetchMoreStatusesIfNeeded(shownIndex: 2)
        
        // then
        XCTAssertEqual(timelineService.fetchPublicTimelinesMaxIdCallsCount, 2)
        XCTAssertEqual(timelineService.fetchPublicTimelinesMaxIdReceivedMaxId, receivedStatuses.last!.id)
        XCTAssertEqual(rowsDirector.constructRowModelsFromCallsCount, 2)
        XCTAssertEqual(rowsDirector.constructRowModelsFromReceivedStatuses?.count, receivedStatuses.count * 2)
    }

    func testViewModelDoesNotFetchMoreStatusesWhenIndexNotLast() async throws {
        // given
        let receivedStatuses = TestData.statuses
        rowsDirector.constructRowModelsFromReturnValue = [TestData.containerViewModel, TestData.containerViewModel, TestData.containerViewModel]
        timelineService.fetchPublicTimelinesMaxIdReturnValue = .success(receivedStatuses)
        try await viewModel.fetchPublicTimelines()
        
        // when
        try await viewModel.fetchMoreStatusesIfNeeded(shownIndex: 0)
        
        // then
        XCTAssertEqual(timelineService.fetchPublicTimelinesMaxIdCallsCount, 1)
        XCTAssertEqual(timelineService.fetchPublicTimelinesMaxIdReceivedMaxId, nil)
    }
}

extension TimelineListViewModelsTests {
    enum TestData {
        static let statuses = [Status.stubData, Status.emptyContentStatus, Status.stubData]
        static let containerViewModel = TimelineStatusContainerView.Model(
            id: "id",
            headerModel: .stubData,
            textModel: .stubData,
            attachmentsModel: [.stubData, .stubData],
            footerModel: .stubData
        )
    }
}
