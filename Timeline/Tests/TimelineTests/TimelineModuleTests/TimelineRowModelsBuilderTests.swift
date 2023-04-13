//
//  TimelineRowModelsBuilderTests.swift
//  
//
//  Created by John Snow on 13/04/2023.
//

import XCTest
@testable import Timeline

final class TimelineRowModelsBuilderTests: XCTestCase {
    private var dateFormatterMock: TimelineStatusDateFormatterProtocolMock!
    private var builder: TimelineRowModelsBuilder!
    
    override func setUp() {
        super.setUp()
        dateFormatterMock = TimelineStatusDateFormatterProtocolMock()
        builder = TimelineRowModelsBuilder(dateFormatter: dateFormatterMock)
    }
    
    override func tearDown() {
        dateFormatterMock = nil
        builder = nil
        super.tearDown()
    }
    
    func testBuilderBuildsCorrectModelWithTextComponent() {
        // given
        dateFormatterMock.formatDateReturnValue = "5s"
        
        // when
        builder.buildHeaderComponent(from: TestData.status)
        builder.buildTextComponent(from: TestData.status.content)
        builder.buildFooterComponent(from: TestData.status)
        let result = builder.construct(id: TestData.status.id)
        
        // then
        XCTAssertTrue(result.id == TestData.status.id)
        XCTAssertTrue(result.headerModel.createdAt == dateFormatterMock.formatDateReturnValue)
        XCTAssertTrue(result.headerModel.avatarStatic == TestData.status.account.avatarStatic)
        XCTAssertTrue(result.headerModel.displayName == TestData.status.account.displayName)
        XCTAssertTrue(result.headerModel.username == "@\(TestData.status.account.username)")
        
        XCTAssertTrue(result.textModel?.text == TestData.status.content.htmlToAttributed())
        
        XCTAssertTrue(result.footerModel.isBookmarked == TestData.status.bookmarked)
        XCTAssertTrue(result.footerModel.isFavourited == TestData.status.favourited)
        XCTAssertTrue(result.footerModel.isReblogged == TestData.status.reblogged)
        XCTAssertTrue(result.footerModel.favouritesCount == TestData.status.favouritesCount)
        XCTAssertTrue(result.footerModel.reblogsCount == TestData.status.reblogsCount)
        XCTAssertTrue(result.footerModel.repliesCount == TestData.status.repliesCount)
    }
    
    func testBuilderBuildsCorrectModelWithoutTextComponent() {
        // given
        dateFormatterMock.formatDateReturnValue = "5s"
        
        // when
        builder.buildHeaderComponent(from: TestData.status)
        builder.buildFooterComponent(from: TestData.status)
        let result = builder.construct(id: TestData.status.id)
        
        // then
        XCTAssertTrue(result.id == TestData.status.id)
        XCTAssertTrue(result.headerModel.createdAt == dateFormatterMock.formatDateReturnValue)
        XCTAssertTrue(result.headerModel.avatarStatic == TestData.status.account.avatarStatic)
        XCTAssertTrue(result.headerModel.displayName == TestData.status.account.displayName)
        XCTAssertTrue(result.headerModel.username == "@\(TestData.status.account.username)")
        
        XCTAssertNil(result.textModel?.text)
        
        XCTAssertTrue(result.footerModel.isBookmarked == TestData.status.bookmarked)
        XCTAssertTrue(result.footerModel.isFavourited == TestData.status.favourited)
        XCTAssertTrue(result.footerModel.isReblogged == TestData.status.reblogged)
        XCTAssertTrue(result.footerModel.favouritesCount == TestData.status.favouritesCount)
        XCTAssertTrue(result.footerModel.reblogsCount == TestData.status.reblogsCount)
        XCTAssertTrue(result.footerModel.repliesCount == TestData.status.repliesCount)
    }
}

private extension TimelineRowModelsBuilderTests {
    enum TestData {
        static let status = Status.stubData
        static let account = Account.stubData
    }
}
