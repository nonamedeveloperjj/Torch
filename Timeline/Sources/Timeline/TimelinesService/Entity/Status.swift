//
//  Status.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct Status: Decodable {
    /// ID of the status in the database.
    let id: String
    
    /// URI of the status used for federation.
    let uri: String
    
    /// The date when this status was created.
    let createdAt: String
    
    /// The account that authored this status.
    let account: Account
    
    /// HTML-encoded status content.
    let content: String
    
    /// Visibility of this status.
    let visibility: Visibility
    
    /// Is this status marked as sensitive content?
    let sensitive: Bool
    
    /// Subject or summary line, below which status content is collapsed until expanded.
    let spoilerText: String
    
    /// Media that is attached to this status.
    let mediaAttachments: [MediaAttachment]
    
    /// The application used to post this status.
    let application: Application?
    
    /// Mentions of users within the status content.
    let mentions: [Mention]
    
    /// Hashtags used within the status content.
    let tags: [Tag]
    
    /// Custom emoji to be used when rendering status content.
    let emojis: [CustomEmoji]
    
    /// How many boosts this status has received.
    let reblogsCount: Int
    
    /// How many favourites this status has received.
    let favouritesCount: Int
    
    /// How many replies this status has received.
    let repliesCount: Int
    
    /// A link to the status’s HTML representation.
    let url: String?
    
    /// ID of the status being replied to.
    let inReplyToId: String?
    
    /// ID of the account that authored the status being replied to.
    let inReplyToAccountId: String?
    
    /// The status being reblogged.
    let reblog: Box<Status>?
    
    /// The poll attached to the status.
    let poll: Poll?
    
    /// Preview card for links included within status content.
    let card: PreviewCard?
    
    ///  Primary language of this status.
    let language: String?
    
    /// Plain-text source of a status. Returned instead of content when status is deleted, so the user may redraft from the source text without the client having to reverse-engineer the original text from the HTML content.
    let text: String?
    
    /// Timestamp of when the status was last edited.
    let editedAt: String?
    
    /// If the current token has an authorized user: Have you favourited this status?
    let favourited: Bool?
    
    ///  If the current token has an authorized user: Have you boosted this status?
    let reblogged: Bool?
    
    /// If the current token has an authorized user: Have you muted notifications for this status’s conversation?
    let muted: Bool?
    
    ///If the current token has an authorized user: Have you bookmarked this status?
    let bookmarked: Bool?
    
    /// If the current token has an authorized user: Have you pinned this status? Only appears if the status is pinnable.
    let pinned: Bool?
    
    /// If the current token has an authorized user: The filter and keywords that matched this status.
    let filtered: [FilterResult]?
}

extension Status {
    enum Visibility: String, Decodable {
        case publicVisibility = "public"
        case unlistedVisibility = "unlisted"
        case privateVisibility = "private"
        case directVisibility = "direct"
        
        enum CodingKeys: String, CodingKey {
            case publicVisibility = "public"
            case unlistedVisibility = "unlisted"
            case privateVisibility = "private"
            case directVisibility = "direct"
        }
    }
    
    struct Application: Decodable {
        /// The name of the application that posted this status.
        let name: String
        
        /// The website associated with the application that posted this status.
        let website: String?
    }
    
    struct Mention: Decodable {
        /// The account ID of the mentioned user.
        let id: String
        
        /// The username of the mentioned user.
        let username: String
        
        /// The location of the mentioned user’s profile.
        let url: String
        
        /// The webfinger acct: URI of the mentioned user. Equivalent to username for local users, or username@domain for remote users.
        let acct: String
    }
    
    struct Tag: Decodable {
        /// The value of the hashtag after the # sign.
        let name: String
        
        /// A link to the hashtag on the instance.
        let url: String
    }
}

extension Status {
    enum CodingKeys: String, CodingKey {
        case id
        case uri
        case createdAt = "created_at"
        case account
        case content
        case visibility
        case sensitive
        case spoilerText = "spoiler_text"
        case mediaAttachments = "media_attachments"
        case application
        case mentions
        case tags
        case emojis
        case reblogsCount = "reblogs_count"
        case favouritesCount = "favourites_count"
        case repliesCount = "replies_count"
        case url
        case inReplyToId = "in_reply_to_id"
        case inReplyToAccountId = "in_reply_to_account_id"
        case reblog
        case poll
        case card
        case language
        case text
        case editedAt = "edited_at"
        case favourited
        case reblogged
        case muted
        case bookmarked
        case pinned
        case filtered
    }
}
