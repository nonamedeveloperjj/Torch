//
//  TimelineListViewModel.swift
//
//
//  Created by John Snow on 06/04/2023.
//

import Foundation

protocol TimelineListViewModelProtocol: AnyObject, ObservableObject {
    func fetchPublicTimelines() async throws
}

final class TimelineListViewModel: TimelineListViewModelProtocol {
    @Published var statuses: [Status] = []

    private let timelineService: TimelineServiceProtocol

    init(timelineService: TimelineServiceProtocol) {
        self.timelineService = timelineService
    }

    func fetchPublicTimelines() async throws {
        let result = try await timelineService.fetchPublicTimelines()

        switch result {
        case let .success(statuses):
            self.statuses = statuses
        case let .failure(error):
            print(error)
        }
    }
}
