//
//  TimelineStatusSingleImageView.swift
//  
//
//  Created by John Snow on 14/04/2023.
//

import SwiftUI

struct TimelineStatusSingleImageView: View {
    @State private var model: Model
    
    var body: some View {
        let smallImageMeta = model.image.meta.small
        AsyncImage(url: model.image.previewUrl) { image in
            image
                .resizable()
                .cornerRadius(12.0)
        } placeholder: {
            Color.gray.opacity(0.9)
        }.frame(
            height: CGFloat(smallImageMeta.height)
        )
    }
    
    init(model: TimelineStatusSingleImageView.Model) {
        _model = State(initialValue: model)
    }
}

extension TimelineStatusSingleImageView {
    struct Model {
        let image: ImageAttachment
    }
}

struct TimelineStatusSingleImageView_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TimelineStatusSingleImageView(
            model: .init(
                image: ImageAttachment(
                    previewUrl: URL(
                        string: "https://files.mastodon.social/cache/media_attachments/files/110/196/226/634/650/093/small/7e026ecfc74d12ca.png")!,
                    meta: .stubData!
                )
            )
        )
    }
}
