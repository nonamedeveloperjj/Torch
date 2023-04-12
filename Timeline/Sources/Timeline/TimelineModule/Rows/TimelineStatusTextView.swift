//
//  TimelineStatusTextView.swift
//  
//
//  Created by John Snow on 10/04/2023.
//

import SwiftUI

struct TimelineStatusTextView: View {
    @State private var model: Model
    
    var body: some View {
        Text(styledText)
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
    }
    
    private var styledText: AttributedString {
        var textToStyle = model.text
        textToStyle.font = .system(size: 17.0)
        
        return textToStyle
    }
    
    init(model: TimelineStatusTextView.Model) {
        _model = State(initialValue: model)
    }
}

extension TimelineStatusTextView {
    struct Model {
        let text: AttributedString
        
        static let stubData = TimelineStatusTextView.Model(
            text: "<p>A. N. R. Robinson, who died OTD in 2014, served as the third President of <a href=\"https://mastodon.world/tags/Trinidad\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>Trinidad</span></a> and Tobago, from 1997 to 2003; he had also been the third Prime Minister, from 1986 to 1991 <a href=\"https://cromwell-intl.com/travel/trinidad/job.html?s=mb\" rel=\"nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">https://</span><span class=\"ellipsis\">cromwell-intl.com/travel/trini</span><span class=\"invisible\">dad/job.html?s=mb</span></a> <a href=\"https://mastodon.world/tags/travel\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>travel</span></a> <a href=\"https://mastodon.world/tags/history\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>history</span></a></p>".htmlToAttributed()!
        )
    }
}

struct TimelineStatusTextView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineStatusTextView(model: .stubData)
    }
}
