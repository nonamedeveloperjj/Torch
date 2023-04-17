//
//  TimelineStatusMultipleImageView.swift
//  
//
//  Created by John Snow on 14/04/2023.
//

import SwiftUI

struct TimelineStatusMultipleImageView: View {
    @State private var model: Model
    @State private var gridLayout: [GridItem]
    
    var body: some View {
        ScrollView([]) {
            GeometryReader { geometry in
                LazyVGrid(columns: gridLayout, alignment: .leading, spacing: 4) {
                    ForEach(model.imagePreviewUrls.indices, id: \.self) { index in
                        let previewsCount = model.imagePreviewUrls.count
                        let shouldApplyFullWidth = !previewsCount.isMultiple(of: 2) && index == previewsCount - 1
                        let width = geometry.size.width
                        asyncImage(with: model.imagePreviewUrls[index])
                                                .frame(width: shouldApplyFullWidth ? width: width / 2)
                    }
                }
            }
        }
    }
    
    init(model: Model) {
        _model = State(initialValue: model)
        _gridLayout = State(initialValue: [GridItem(.flexible()), GridItem(.flexible())])
    }
    
    private func asyncImage(with url: URL) -> some View {
        AsyncImage(url: url) { image in
            image
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 150)
                .cornerRadius(12.0)
        } placeholder: {
            Color.gray.opacity(0.9)
        }
    }
}

extension TimelineStatusMultipleImageView {
    struct Model {
        let imagePreviewUrls: [URL]
    }
}

struct TimelineStatusMultipleImageView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TimelineStatusMultipleImageView(
            model: .init(
                imagePreviewUrls: [
                    URL(string: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/630/262/961/small/c776bc75a41ceaa6.jpeg")!,
                    URL(string: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/728/681/964/small/1aea142b25c0ec2d.jpeg")!,
                    URL(string: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/630/262/961/small/c776bc75a41ceaa6.jpeg")!,
                    URL(string: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/630/262/961/small/c776bc75a41ceaa6.jpeg")!
                ]
            )
        )
    }
}
