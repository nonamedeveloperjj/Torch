//
//  FilterResult.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct FilterResult: Decodable {
    /// The filter that was matched.
    let filter: Filter
    
    /// The keyword within the filter that was matched.
    let keywordMatches: [String]?
    
    /// The status ID within the filter that was matched.
    let statusMatches: [String]?
}

extension FilterResult {
    enum CodingKeys: String, CodingKey {
        case filter
        case keywordMatches = "keyword_matches"
        case statusMatches = "status_matches"
    }
}
