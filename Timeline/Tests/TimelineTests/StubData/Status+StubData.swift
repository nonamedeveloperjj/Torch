//
//  Status+StubData.swift
//  
//
//  Created by John Snow on 13/04/2023.
//

import Foundation
@testable import Timeline

extension Status {
    static let stubData = Status(
        id: "id",
        uri: "uri",
        createdAt: Date(),
        account: Account.stubData,
        content: "<p>A. N. R. Robinson, who died OTD in 2014, served as the third President of <a href=\"https://mastodon.world/tags/Trinidad\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>Trinidad</span></a> and Tobago, from 1997 to 2003; he had also been the third Prime Minister, from 1986 to 1991 <a href=\"https://cromwell-intl.com/travel/trinidad/job.html?s=mb\" rel=\"nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">https://</span><span class=\"ellipsis\">cromwell-intl.com/travel/trini</span><span class=\"invisible\">dad/job.html?s=mb</span></a> <a href=\"https://mastodon.world/tags/travel\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>travel</span></a> <a href=\"https://mastodon.world/tags/history\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>history</span></a></p>",
        visibility: .publicVisibility,
        sensitive: false,
        spoilerText: "",
        mediaAttachments: [],
        application: nil,
        mentions: [],
        tags: [],
        emojis: [],
        reblogsCount: 0,
        favouritesCount: 0,
        repliesCount: 0,
        url: nil,
        inReplyToId: nil,
        inReplyToAccountId: nil,
        reblog: nil,
        poll: nil,
        card: nil,
        language: nil,
        text: nil,
        editedAt: nil,
        favourited: false,
        reblogged: false,
        muted: nil,
        bookmarked: false,
        pinned: nil,
        filtered: nil
    )
    
    static let imageAttachmentsStatus = Status(
        id: "id",
        uri: "uri",
        createdAt: Date(),
        account: Account.stubData,
        content: "<p>A. N. R. Robinson, who died OTD in 2014, served as the third President of <a href=\"https://mastodon.world/tags/Trinidad\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>Trinidad</span></a> and Tobago, from 1997 to 2003; he had also been the third Prime Minister, from 1986 to 1991 <a href=\"https://cromwell-intl.com/travel/trinidad/job.html?s=mb\" rel=\"nofollow noopener noreferrer\" target=\"_blank\"><span class=\"invisible\">https://</span><span class=\"ellipsis\">cromwell-intl.com/travel/trini</span><span class=\"invisible\">dad/job.html?s=mb</span></a> <a href=\"https://mastodon.world/tags/travel\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>travel</span></a> <a href=\"https://mastodon.world/tags/history\" class=\"mention hashtag\" rel=\"nofollow noopener noreferrer\" target=\"_blank\">#<span>history</span></a></p>",
        visibility: .publicVisibility,
        sensitive: false,
        spoilerText: "",
        mediaAttachments: [
            MediaAttachment(
                id: "id1",
                type: .image,
                url: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/630/262/961/small/c776bc75a41ceaa6.jpeg",
                previewUrl: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/630/262/961/small/c776bc75a41ceaa6.jpeg",
                remoteUrl: nil,
                meta: ["small": ["width": 480, "height": 480],
                "original": ["width": 1080, "height": 1080]],
                descriptionString: nil,
                blurhash: nil
            ),
            MediaAttachment(
                id: "id2",
                type: .image,
                url: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/728/681/964/small/1aea142b25c0ec2d.jpeg",
                previewUrl: "https://files.mastodon.social/cache/media_attachments/files/110/196/277/728/681/964/small/1aea142b25c0ec2d.jpeg",
                remoteUrl: nil,
                meta: ["small": ["width": 480, "height": 480],
                "original": ["width": 1080, "height": 1080]],
                descriptionString: nil,
                blurhash: nil
            )
        ],
        application: nil,
        mentions: [],
        tags: [],
        emojis: [],
        reblogsCount: 0,
        favouritesCount: 0,
        repliesCount: 0,
        url: nil,
        inReplyToId: nil,
        inReplyToAccountId: nil,
        reblog: nil,
        poll: nil,
        card: nil,
        language: nil,
        text: nil,
        editedAt: nil,
        favourited: false,
        reblogged: false,
        muted: nil,
        bookmarked: false,
        pinned: nil,
        filtered: nil
    )
    
    static let emptyContentStatus = Status(
        id: "id",
        uri: "uri",
        createdAt: Date(),
        account: Account.stubData,
        content: "",
        visibility: .publicVisibility,
        sensitive: false,
        spoilerText: "",
        mediaAttachments: [],
        application: nil,
        mentions: [],
        tags: [],
        emojis: [],
        reblogsCount: 0,
        favouritesCount: 0,
        repliesCount: 0,
        url: nil,
        inReplyToId: nil,
        inReplyToAccountId: nil,
        reblog: nil,
        poll: nil,
        card: nil,
        language: nil,
        text: nil,
        editedAt: nil,
        favourited: false,
        reblogged: false,
        muted: nil,
        bookmarked: false,
        pinned: nil,
        filtered: nil
    )
}
