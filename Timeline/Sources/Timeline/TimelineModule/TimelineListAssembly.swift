//
//  TimelineListAssembly.swift
//  
//
//  Created by John Snow on 10/04/2023.
//

import Foundation
import TorchNetwork

protocol TimelineListAssemblyProtocol: AnyObject {
    func assemble() -> TimelineListView
}

public final class TimelineListAssembly: TimelineListAssemblyProtocol {
    public init() {}
    
    public func assemble() -> TimelineListView {
        let timelineService = TimelineService(networkClient: HTTPClientAssembly().create())
        let dateFormatter = TimelineStatusDateFormatter()
        let rowsBuilder = TimelineRowModelsBuilder(dateFormatter: dateFormatter)
        let rowsDirector = TimelineRowModelsDirector(rowsBuilder: rowsBuilder)
        let viewModel = TimelineListViewModel(timelineService: timelineService, rowsDirector: rowsDirector)
        
        return TimelineListView(viewModel: viewModel)
    }
}
