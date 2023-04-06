//
//  FilterKeyword.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct FilterKeyword: Decodable {
    /// The ID of the FilterKeyword in the database.
    let id: String
    
    /// The phrase to be matched against.
    let keyword: String
    
    /// Should the filter consider word boundaries?
    let wholeWord: Bool
}

extension FilterKeyword {
    enum CodingKeys: String, CodingKey {
        case id
        case keyword
        case wholeWord = "whole_word"
    }
}
