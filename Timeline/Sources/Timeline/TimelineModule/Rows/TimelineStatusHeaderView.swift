//
//  TimelineStatusHeaderView.swift
//  
//
//  Created by John Snow on 07/04/2023.
//

import SwiftUI

struct TimelineStatusHeaderView: View {
    @State private var model: Model
    
    var body: some View {
        HStack() {
            AsyncImage(url: URL(string: model.avatarStatic)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(width: 44, height: 44)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack(alignment: .firstTextBaseline, spacing: 6.0) {
                    Text(model.displayName)
                        .font(.system(size: 18.0, weight: .semibold))
                        .lineLimit(1)
                    Text(model.username)
                        .font(.system(size: 14.0))
                        .foregroundColor(.secondary)
                }
                
                Text(model.createdAt)
                    .font(.system(size: 14.0))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
    
    
    init(model: TimelineStatusHeaderView.Model) {
        self.model = model
    }
}

extension TimelineStatusHeaderView {
    struct Model {
        let displayName: String
        let username: String
        let avatarStatic: String
        let createdAt: String
        
        static let stubData = Model(
            displayName: "Hacker news",
            username: "@hkrn@mstdn.social",
            avatarStatic: "https://files.mastodon.social/cache/accounts/avatars/000/777/270/original/b49472998ed25599.png",
            createdAt: "17 ч назад"
        )
    }
}

struct TimelineStatusHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        TimelineStatusHeaderView(model: .stubData)
    }
}
