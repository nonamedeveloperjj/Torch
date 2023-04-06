//
//  Field.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct Field: Decodable {
    /// The key of a given field’s key-value pair.
    let name: String
    
    /// The value associated with the name key.
    let value: String
    
    /// Timestamp of when the server verified a URL value for a rel=“me” link. NULLABLE String (ISO 8601 Datetime) if value is a verified URL. 
    let verifiedAt: String?
}

extension Field {
    enum CodingKeys: String, CodingKey {
        case name
        case value
        case verifiedAt = "verified_at"
    }
}
