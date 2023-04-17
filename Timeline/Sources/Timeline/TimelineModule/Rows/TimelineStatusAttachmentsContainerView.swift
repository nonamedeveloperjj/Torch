//
//  TimelineStatusAttachmentsContainerView.swift
//  
//
//  Created by John Snow on 14/04/2023.
//

import SwiftUI

struct TimelineStatusAttachmentsContainerView: View {
    @State private var model: [Model]
    
    var body: some View {
        let attachmentType = model.first?.type
        
        switch attachmentType {
        case .image:
            if model.count > 1 {
                let gridHeight = model.count > 2 ? 308.0 : 154.0
                TimelineStatusMultipleImageView(
                    model: .init(
                        imagePreviewUrls: model.map { $0.previewUrl }
                    )
                ).frame(height: gridHeight)
            } else if let image = model.first {
                TimelineStatusSingleImageView(
                    model: .init(
                        image: ImageAttachment(
                            previewUrl: image.previewUrl,
                            meta: image.imageMeta
                        )
                    )
                )
            }
        default:
            EmptyView()
        }
    }
    
    init(model: [Model]) {
        _model = State(initialValue: model)
    }
}

extension TimelineStatusAttachmentsContainerView {
    struct Model {
        let type: MediaAttachment.AttachmentType
        let imageMeta: ImageMeta
        let url: URL
        let previewUrl: URL
        
        static let stubData = Model(
            type: .image,
            imageMeta: .stubData!,
            url: URL(string: "https://files.mastodon.social/cache/media_attachments/files/110/196/226/634/650/093/small/7e026ecfc74d12ca.png")!,
            previewUrl: URL(string: "https://files.mastodon.social/cache/media_attachments/files/110/196/226/634/650/093/small/7e026ecfc74d12ca.png")!
        )
    }
}

struct TimelineStatusAttachmentsContainerView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TimelineStatusAttachmentsContainerView(model: [.stubData])
    }
}
