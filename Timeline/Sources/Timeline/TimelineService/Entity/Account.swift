//
//  Account.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct Account: Decodable {
    /// The account id.
    let id: String
    
    /// The username of the account, not including domain.
    let username: String
    
    /// The Webfinger account URI. Equal to username for local users, or username@domain for remote users.
    let acct: String
    
    ///  The location of the user’s profile page.
    let url: String
    
    /// The profile’s display name.
    let displayName: String
    
    /// The profile’s bio or description.
    let note: String
    
    /// An image icon that is shown next to statuses and in the profile.
    let avatar: String
    
    /// A static version of the avatar. Equal to avatar if its value is a static image; different if avatar is an animated GIF.
    let avatarStatic: String
    
    /// An image banner that is shown above the profile and in profile cards.
    let header: String
    
    /// A static version of the header. Equal to header if its value is a static image; different if header is an animated GIF.
    let headerStatic: String
    
    /// Whether the account manually approves follow requests.
    let locked: Bool
    
    /// Additional metadata attached to a profile as name-value pairs.
    let fields: [Field]
    
    /// Custom emoji entities to be used when rendering the profile.
    let emojes: [CustomEmoji]
    
    /// Indicates that the account may perform automated actions, may not be monitored, or identifies as a robot.
    let bot: Bool
    
    /// Indicates that the account represents a Group actor.
    let group: Bool
    
    /// Whether the account has opted into discovery features such as the profile directory.
    let discoverable: Bool?
    
    /// Whether the local user has opted out of being indexed by search engines.
    let noindex: Bool?
    
    /// Indicates that the profile is currently inactive and that its user has moved to a new account.
    let moved: Box<Account>?
    
    /// An extra attribute returned only when an account is suspended.
    let suspended: Bool?
    
    /// An extra attribute returned only when an account is silenced. If true, indicates that the account should be hidden behind a warning screen.
    let limited: Bool?
    
    /// When the account was created.
    let createdAt: String
    
    /// When the most recent status was posted.
    let lastStatusAt: String?
    
    /// How many statuses are attached to this account.
    let statusesCount: Int
    
    /// The reported followers of this profile.
    let followersCount: Int
    
    /// The reported follows of this profile.
    let followingCount: Int
}

extension Account {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.username = try container.decode(String.self, forKey: .username)
        self.acct = try container.decode(String.self, forKey: .acct)
        self.url = try container.decode(String.self, forKey: .url)
        self.displayName = try container.decode(String.self, forKey: .displayName)
        self.note = try container.decode(String.self, forKey: .note)
        self.avatar = try container.decode(String.self, forKey: .avatar)
        self.avatarStatic = try container.decode(String.self, forKey: .avatarStatic)
        self.header = try container.decode(String.self, forKey: .header)
        self.headerStatic = try container.decode(String.self, forKey: .headerStatic)
        self.locked = try container.decode(Bool.self, forKey: .locked)
        self.fields = try container.decode([Field].self, forKey: .fields)
        self.emojes = try container.decode([CustomEmoji].self, forKey: .emojis)
        self.bot = try container.decode(Bool.self, forKey: .bot)
        self.group = try container.decode(Bool.self, forKey: .group)
        self.discoverable = try? container.decode(Bool.self, forKey: .discoverable)
        self.noindex = try? container.decode(Bool.self, forKey: .noindex)
        self.moved = try? container.decode(Box<Account>?.self, forKey: .moved)
        self.suspended = try? container.decode(Bool.self, forKey: .suspended)
        self.limited = try? container.decode(Bool.self, forKey: .limited)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.lastStatusAt = try? container.decode(String.self, forKey: .lastStatusAt)
        self.statusesCount = try container.decode(Int.self, forKey: .statusesCount)
        self.followersCount = try container.decode(Int.self, forKey: .followersCount)
        self.followingCount = try container.decode(Int.self, forKey: .followingCount)
    }
}

extension Account {
    enum CodingKeys: String, CodingKey {
        case id
        case username
        case acct
        case url
        case displayName = "display_name"
        case note
        case avatar
        case avatarStatic = "avatar_static"
        case header
        case headerStatic = "header_static"
        case locked
        case fields
        case emojis
        case bot
        case group
        case discoverable
        case noindex
        case moved
        case suspended
        case limited
        case createdAt = "created_at"
        case lastStatusAt = "last_status_at"
        case statusesCount = "statuses_count"
        case followersCount = "followers_count"
        case followingCount = "following_count"
    }
}
