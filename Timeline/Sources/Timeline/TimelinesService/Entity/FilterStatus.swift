//
//  FilterStatus.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct FilterStatus: Decodable {
    /// The ID of the FilterStatus in the database.
    let id: String
    
    /// The ID of the Status that will be filtered.
    let statusId: String
}
