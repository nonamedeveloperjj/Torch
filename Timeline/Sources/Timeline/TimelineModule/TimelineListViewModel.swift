//
//  TimelineListViewModel.swift
//
//
//  Created by John Snow on 06/04/2023.
//

import Foundation

protocol TimelineListViewModelProtocol: AnyObject, ObservableObject {
    func fetchPublicTimelines() async throws
    func fetchMoreStatusesIfNeeded(shownIndex: Int) async throws
}

final class TimelineListViewModel: TimelineListViewModelProtocol {
    @Published var rowModels: [TimelineStatusContainerView.Model] = []
    @Published var isLoadingMoreStatuses = false
    private var statuses: [Status] = []

    private let timelineService: TimelineServiceProtocol
    private let rowsDirector: TimelineRowModelsDirectorProtocol

    init(timelineService: TimelineServiceProtocol, rowsDirector: TimelineRowModelsDirectorProtocol) {
        self.timelineService = timelineService
        self.rowsDirector = rowsDirector
    }

    func fetchPublicTimelines() async throws {
        let result = try await timelineService.fetchPublicTimelines(maxId: nil)

        switch result {
        case let .success(statuses):
            await MainActor.run {
                self.statuses = statuses
                self.rowModels = self.rowsDirector.constructRowModels(from: statuses)
            }
        case let .failure(error):
            print(error)
        }
    }
    
    func fetchMoreStatusesIfNeeded(shownIndex: Int) async throws {
        guard shownIndex == rowModels.count - 1, let maxId = statuses.last?.id else { return }
        
        await MainActor.run {
            isLoadingMoreStatuses = true
        }
        
        let result = try await timelineService.fetchPublicTimelines(maxId: maxId)
                
        switch result {
        case let .success(statuses):
            await MainActor.run {
                self.statuses.append(contentsOf: statuses)
                self.rowModels = self.rowsDirector.constructRowModels(from: self.statuses)
                isLoadingMoreStatuses = false
            }
        case let .failure(error):
            print(error)
        }
    }
}
