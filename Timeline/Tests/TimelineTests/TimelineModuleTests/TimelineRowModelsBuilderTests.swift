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
        XCTAssertTrue(result.textModel?.text == TestData.status.content.htmlToAttributed())
    }
    
    func testBuilderBuildsCorrectModelWithAttachmentComponent() {
        // given
        let mediaAttachments = TestData.statusWithImageAttachments.mediaAttachments!
        dateFormatterMock.formatDateReturnValue = "7m"
        
        // when
        builder.buildHeaderComponent(from: TestData.status)
        builder.buildAttachmentsComponent(from: mediaAttachments)
        builder.buildFooterComponent(from: TestData.status)
        let result = builder.construct(id: TestData.status.id)
        
        // then
        XCTAssertEqual(result.attachmentsModel?.count, mediaAttachments.count)
        
        result.attachmentsModel?.enumerated().forEach { index, value in
            XCTAssertEqual(value.type, mediaAttachments[index].type)
            XCTAssertEqual(value.imageMeta, ImageMeta(jsonDictionary: mediaAttachments[index].meta))
            XCTAssertEqual(value.url.absoluteString, mediaAttachments[index].url)
            XCTAssertEqual(value.previewUrl.absoluteString, mediaAttachments[index].previewUrl)
        }
    }
    
    func testBuilderBuildsCorrectBacicModel() {
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
        
        XCTAssertNil(result.textModel)
        XCTAssertNil(result.attachmentsModel)
        
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
        static let statusWithImageAttachments = Status.imageAttachmentsStatus
    }
}
