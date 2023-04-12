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
