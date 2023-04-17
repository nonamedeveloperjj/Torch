// Generated using Sourcery 1.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif


@testable import Timeline














class TimelineRowModelsBuilderProtocolMock: TimelineRowModelsBuilderProtocol {

    //MARK: - buildHeaderComponent

    var buildHeaderComponentFromCallsCount = 0
    var buildHeaderComponentFromCalled: Bool {
        return buildHeaderComponentFromCallsCount > 0
    }
    var buildHeaderComponentFromReceivedStatus: Status?
    var buildHeaderComponentFromReceivedInvocations: [Status] = []
    var buildHeaderComponentFromClosure: ((Status) -> Void)?

    func buildHeaderComponent(from status: Status) {
        buildHeaderComponentFromCallsCount += 1
        buildHeaderComponentFromReceivedStatus = status
        buildHeaderComponentFromReceivedInvocations.append(status)
        buildHeaderComponentFromClosure?(status)
    }

    //MARK: - buildTextComponent

    var buildTextComponentFromCallsCount = 0
    var buildTextComponentFromCalled: Bool {
        return buildTextComponentFromCallsCount > 0
    }
    var buildTextComponentFromReceivedText: String?
    var buildTextComponentFromReceivedInvocations: [String] = []
    var buildTextComponentFromClosure: ((String) -> Void)?

    func buildTextComponent(from text: String) {
        buildTextComponentFromCallsCount += 1
        buildTextComponentFromReceivedText = text
        buildTextComponentFromReceivedInvocations.append(text)
        buildTextComponentFromClosure?(text)
    }

    //MARK: - buildAttachmentsComponent

    var buildAttachmentsComponentFromCallsCount = 0
    var buildAttachmentsComponentFromCalled: Bool {
        return buildAttachmentsComponentFromCallsCount > 0
    }
    var buildAttachmentsComponentFromReceivedAttachments: [MediaAttachment]?
    var buildAttachmentsComponentFromReceivedInvocations: [[MediaAttachment]] = []
    var buildAttachmentsComponentFromClosure: (([MediaAttachment]) -> Void)?

    func buildAttachmentsComponent(from attachments: [MediaAttachment]) {
        buildAttachmentsComponentFromCallsCount += 1
        buildAttachmentsComponentFromReceivedAttachments = attachments
        buildAttachmentsComponentFromReceivedInvocations.append(attachments)
        buildAttachmentsComponentFromClosure?(attachments)
    }

    //MARK: - buildFooterComponent

    var buildFooterComponentFromCallsCount = 0
    var buildFooterComponentFromCalled: Bool {
        return buildFooterComponentFromCallsCount > 0
    }
    var buildFooterComponentFromReceivedStatus: Status?
    var buildFooterComponentFromReceivedInvocations: [Status] = []
    var buildFooterComponentFromClosure: ((Status) -> Void)?

    func buildFooterComponent(from status: Status) {
        buildFooterComponentFromCallsCount += 1
        buildFooterComponentFromReceivedStatus = status
        buildFooterComponentFromReceivedInvocations.append(status)
        buildFooterComponentFromClosure?(status)
    }

    //MARK: - construct

    var constructIdCallsCount = 0
    var constructIdCalled: Bool {
        return constructIdCallsCount > 0
    }
    var constructIdReceivedId: String?
    var constructIdReceivedInvocations: [String] = []
    var constructIdReturnValue: TimelineStatusContainerView.Model!
    var constructIdClosure: ((String) -> TimelineStatusContainerView.Model)?

    func construct(id: String) -> TimelineStatusContainerView.Model {
        constructIdCallsCount += 1
        constructIdReceivedId = id
        constructIdReceivedInvocations.append(id)
        if let constructIdClosure = constructIdClosure {
            return constructIdClosure(id)
        } else {
            return constructIdReturnValue
        }
    }

}
class TimelineRowModelsDirectorProtocolMock: TimelineRowModelsDirectorProtocol {

    //MARK: - constructRowModels

    var constructRowModelsFromCallsCount = 0
    var constructRowModelsFromCalled: Bool {
        return constructRowModelsFromCallsCount > 0
    }
    var constructRowModelsFromReceivedStatuses: [Status]?
    var constructRowModelsFromReceivedInvocations: [[Status]] = []
    var constructRowModelsFromReturnValue: [TimelineStatusContainerView.Model]!
    var constructRowModelsFromClosure: (([Status]) -> [TimelineStatusContainerView.Model])?

    func constructRowModels(from statuses: [Status]) -> [TimelineStatusContainerView.Model] {
        constructRowModelsFromCallsCount += 1
        constructRowModelsFromReceivedStatuses = statuses
        constructRowModelsFromReceivedInvocations.append(statuses)
        if let constructRowModelsFromClosure = constructRowModelsFromClosure {
            return constructRowModelsFromClosure(statuses)
        } else {
            return constructRowModelsFromReturnValue
        }
    }

}
class TimelineServiceProtocolMock: TimelineServiceProtocol {

    //MARK: - fetchPublicTimelines

    var fetchPublicTimelinesThrowableError: Error?
    var fetchPublicTimelinesCallsCount = 0
    var fetchPublicTimelinesCalled: Bool {
        return fetchPublicTimelinesCallsCount > 0
    }
    var fetchPublicTimelinesReturnValue: Result<[Status], Error>!
    var fetchPublicTimelinesClosure: (() async throws -> Result<[Status], Error>)?

    func fetchPublicTimelines() async throws -> Result<[Status], Error> {
        if let error = fetchPublicTimelinesThrowableError {
            throw error
        }
        fetchPublicTimelinesCallsCount += 1
        if let fetchPublicTimelinesClosure = fetchPublicTimelinesClosure {
            return try await fetchPublicTimelinesClosure()
        } else {
            return fetchPublicTimelinesReturnValue
        }
    }

}
class TimelineStatusDateFormatterProtocolMock: TimelineStatusDateFormatterProtocol {

    //MARK: - format

    var formatDateCallsCount = 0
    var formatDateCalled: Bool {
        return formatDateCallsCount > 0
    }
    var formatDateReceivedDate: Date?
    var formatDateReceivedInvocations: [Date] = []
    var formatDateReturnValue: String!
    var formatDateClosure: ((Date) -> String)?

    func format(date: Date) -> String {
        formatDateCallsCount += 1
        formatDateReceivedDate = date
        formatDateReceivedInvocations.append(date)
        if let formatDateClosure = formatDateClosure {
            return formatDateClosure(date)
        } else {
            return formatDateReturnValue
        }
    }

}
