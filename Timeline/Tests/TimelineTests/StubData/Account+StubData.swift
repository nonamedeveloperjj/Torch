//
//  File.swift
//  
//
//  Created by John Snow on 13/04/2023.
//

@testable import Timeline

extension Account {
    static let stubData = Account(
        id: "id",
        username: "username",
        acct: "acct",
        url: "url",
        displayName: "displayName",
        note: "note",
        avatar: "avatar",
        avatarStatic: "avatarStatic",
        header: "header",
        headerStatic: "headerStatic",
        locked: false,
        fields: [],
        emojes: [],
        bot: false,
        group: false,
        discoverable: nil,
        noindex: nil,
        moved: nil,
        suspended: nil,
        limited: nil,
        createdAt: "",
        lastStatusAt: nil,
        statusesCount: 0,
        followersCount: 0,
        followingCount: 0
    )
}
