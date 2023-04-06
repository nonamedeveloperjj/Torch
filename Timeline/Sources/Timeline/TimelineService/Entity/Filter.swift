//
//  Filter.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct Filter: Decodable {
    /// The ID of the Filter in the database.
    let id: String
    
    /// A title given by the user to name the filter.
    let title: String
    
    /// The contexts in which the filter should be applied.
    let context: [FilterContext]
    
    /// When the filter should no longer be applied.
    let expiresAt: Date?
    
    /// The action to be taken when a status matches this filter.
    let filterAction: [Action]
    
    /// The keywords grouped under this filter.
    let keywords: [FilterKeyword]
    
    /// The statuses grouped under this filter.
    let filterStatus: [FilterStatus]
}

extension Filter {
    enum FilterContext: String, Decodable {
        /// home timeline and lists
        case home
        /// notifications timeline
        case notifications
        /// public timelines
        case publicContext = "public"
        /// expanded thread of a detailed status
        case thread
        /// when viewing a profile
        case account
        
        enum CodingKeys: String, CodingKey {
            case home
            case notifications
            case publicContext = "public"
            case thread
            case account
        }
    }
    
    enum Action: String, Decodable {
        /// show a warning that identifies the matching filter by title, and allow the user to expand the filtered status. This is the default (and unknown values should be treated as equivalent to warn).
        case warn
        /// do not show this status if it is received
        case hide
    }
}
