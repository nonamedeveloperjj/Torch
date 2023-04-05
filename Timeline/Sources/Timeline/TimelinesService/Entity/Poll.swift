//
//  Poll.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct Poll: Decodable {
    /// The ID of the poll in the database.
    let id: String
    
    /// When the poll ends.
    let expiresAt: Date?
    
    /// Is the poll currently expired?
    let expired: Bool
    
    /// Does the poll allow multiple-choice answers?
    let multiple: Bool
    
    /// How many votes have been received.
    let votesCount: Int
    
    /// How many unique accounts have voted on a multiple-choice poll. Null if multiple is false.
    let votersCount: Int?
    
    /// Possible answers for the poll.
    let options: [Poll]
    
    /// Custom emoji to be used for rendering poll options.
    let emojis: [CustomEmoji]
    
    /// When called with a user token, has the authorized user voted?
    let voted: Bool?
    
    /// When called with a user token, which options has the authorized user chosen? Contains an array of index values for options.
    let ownVotes: [Int]?
}

extension Poll {
    struct Option: Decodable {
        /// The text value of the poll option.
        let title: String
        
        /// The total number of received votes for this option.
        let votesCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case title
            case votesCount = "votes_count"
        }
    }
}

extension Poll {
    enum CodingKeys: String, CodingKey {
        case id
        case expiresAt = "expires_at"
        case expired
        case multiple
        case votesCount = "votes_count"
        case votersCount = "voters_count"
        case options
        case emojis
        case voted
        case ownVotes = "own_votes"
    }
}
