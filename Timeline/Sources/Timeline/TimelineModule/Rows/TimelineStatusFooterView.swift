//
//  TimelineStatusFooterView.swift
//  
//
//  Created by John Snow on 06/04/2023.
//

import SwiftUI

struct TimelineStatusFooterView: View {
    @State private var model: Model
    
    var body: some View {
        HStack(spacing: 0.0) {
            Button {
                
            } label: {
                HStack {
                    image(for: .reply)
                    Text(String(model.repliesCount))
                }
            }.tint(.primary)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack {
                    image(for: .reblog(isReblogged: model.isReblogged))
                    Text(String(model.reblogsCount))
                }
            }.tint(.primary)
            
            Spacer()
            
            Button {
                
            } label: {
                HStack {
                    image(for: .favourite(isFavourited: model.isFavourited))
                    Text(String(model.favouritesCount))
                }
            }.tint(.primary)
            
            Spacer()
            
            Button {
                
            } label: {
                image(for: .bookmark(isBookmarked: model.isBookmarked))
            }.tint(.primary)
            
            Spacer()
            
            Button {
                
            } label: {
                image(for: .share)
            }.tint(.primary)
        }
    }
    
    init(model: Model) {
        self.model = model
    }
    
    private func image(for action: TimelineStatusFooterView.Model.Action) -> Image {
        switch action {
        case .reply:
            return Image(systemName: "arrowshape.turn.up.left")
        case .reblog(let isReblogged):
            return Image(isReblogged ? "rocket.fill" : "rocket", bundle: .module)
        case .favourite(let isFavourited):
            return Image(systemName: isFavourited ? "star.fill" : "star")
        case .bookmark(let isBookmarked):
            return Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
        case .share:
            return Image(systemName: "square.and.arrow.up")
        }
    }
}

extension TimelineStatusFooterView {
    struct Model {
        let repliesCount: Int
        let reblogsCount: Int
        let favouritesCount: Int
        let isReblogged: Bool
        let isFavourited: Bool
        let isBookmarked: Bool
        
        fileprivate enum Action {
            case reply
            case reblog(isReblogged: Bool)
            case favourite(isFavourited: Bool)
            case bookmark(isBookmarked: Bool)
            case share
        }
        
        static let stubData = TimelineStatusFooterView.Model(
            repliesCount: 4,
            reblogsCount: 10,
            favouritesCount: 36,
            isReblogged: false,
            isFavourited: false,
            isBookmarked: false
        )
    }
}

struct TimelineStatusFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineStatusFooterView(
            model: .stubData
        )
    }
}
