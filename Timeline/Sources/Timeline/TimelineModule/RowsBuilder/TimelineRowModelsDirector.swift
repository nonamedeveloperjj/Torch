//
//  TimelineRowModelsDirector.swift
//  
//
//  Created by John Snow on 09/04/2023.
//

import Foundation

// sourcery: AutoMockable
protocol TimelineRowModelsDirectorProtocol: AnyObject {
    func constructRowModels(from statuses: [Status]) -> [TimelineStatusContainerView.Model]
}

final class TimelineRowModelsDirector: TimelineRowModelsDirectorProtocol {
    private let rowsBuilder: TimelineRowModelsBuilderProtocol

    init(rowsBuilder: TimelineRowModelsBuilderProtocol) {
        self.rowsBuilder = rowsBuilder
    }
    
    func constructRowModels(from statuses: [Status]) -> [TimelineStatusContainerView.Model] {
        var rowModels: [TimelineStatusContainerView.Model] = []
        
        statuses.forEach { status in
            rowsBuilder.buildHeaderComponent(from: status)
            
            let content = status.content
            if !content.isEmpty {
                rowsBuilder.buildTextComponent(from: content)
            }
            
            if let mediaAttachments = status.mediaAttachments, !mediaAttachments.isEmpty {
                rowsBuilder.buildAttachmentsComponent(from: mediaAttachments)
            }
            
            rowsBuilder.buildFooterComponent(from: status)
            
            let rowModel = rowsBuilder.construct(id: status.id)
            rowModels.append(rowModel)
        }
        
        return rowModels
    }
}
