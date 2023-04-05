//
//  CustomEmoji.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct CustomEmoji: Decodable {
    /// The name of the custom emoji.
    let shortCode: String
    
    /// A link to the custom emoji.
    let url: String
    
    /// A link to a static copy of the custom emoji.
    let staticUrl: String
    
    /// Whether this Emoji should be visible in the picker or unlisted.
    let visibleInPicker: Bool
    
    /// Used for sorting custom emoji in the picker.
    let category: String
}

extension CustomEmoji {
    enum CodingKeys: String, CodingKey {
        case shortCode = "short_code"
        case url
        case staticUrl = "static_url"
        case visibleInPicker = "visible_in_picker"
        case category = "category"
    }
}
