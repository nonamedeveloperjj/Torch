//
//  TimelineRowModelsBuilder.swift
//
//
//  Created by John Snow on 09/04/2023.
//

import Foundation
import SwiftUI

protocol TimelineRowModelsBuilderProtocol: AnyObject {
    func buildHeaderComponent(from status: Status)
    func buildTextComponent(from text: String)
    func buildFooterComponent(from status: Status)
    func construct(id: String) -> TimelineStatusContainerView.Model
}

final class TimelineRowModelsBuilder: TimelineRowModelsBuilderProtocol {
    private var headerModel: TimelineStatusHeaderView.Model!
    private var textModel: TimelineStatusTextView.Model?
    private var footerModel: TimelineStatusFooterView.Model!
    private let dateFormatter: TimelineStatusDateFormatterProtocol
    
    init(dateFormatter: TimelineStatusDateFormatterProtocol) {
        self.dateFormatter = dateFormatter
    }
    
    func buildHeaderComponent(from status: Status) {
        let headerModel = TimelineStatusHeaderView.Model(
            displayName: status.account.displayName,
            username: "@\(status.account.username)",
            avatarStatic: status.account.avatarStatic,
            createdAt: dateFormatter.format(date: status.createdAt)
        )
        
        self.headerModel = headerModel
    }
    
    func buildTextComponent(from text: String) {
        if let text = text.htmlToAttributed() {
            self.textModel = TimelineStatusTextView.Model(text: text)
        }
    }
    
    func buildFooterComponent(from status: Status) {
        let footerModel = TimelineStatusFooterView.Model(
            repliesCount: status.repliesCount,
            reblogsCount: status.reblogsCount,
            favouritesCount: status.favouritesCount,
            isReblogged: status.reblogged == true,
            isFavourited: status.favourited == true,
            isBookmarked: status.bookmarked == true
        )
        
        self.footerModel = footerModel
    }
    
    func construct(id: String) -> TimelineStatusContainerView.Model {
        defer {
            headerModel = nil
            textModel = nil
            footerModel = nil
        }
        
        return TimelineStatusContainerView.Model(
            id: id,
            headerModel: headerModel,
            textModel: textModel,
            footerModel: footerModel
        )
    }
}
