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
    @Published var rowModels: [TimelineStatusContainerView.Model] = []
    private var statuses: [Status] = []

    private let timelineService: TimelineServiceProtocol
    private let rowsDirector: TimelineRowModelsDirectorProtocol

    init(timelineService: TimelineServiceProtocol, rowsDirector: TimelineRowModelsDirectorProtocol) {
        self.timelineService = timelineService
        self.rowsDirector = rowsDirector
    }

    func fetchPublicTimelines() async throws {
        let result = try await timelineService.fetchPublicTimelines()

        switch result {
        case let .success(statuses):
            DispatchQueue.main.async {
                self.statuses = statuses
                self.rowModels = self.rowsDirector.constructRowModels(from: statuses)                
            }
        case let .failure(error):
            print(error)
        }
    }
}
