//
//  PreviewCard.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct PreviewCard: Decodable {
    /// Location of linked resource.
    let url: String
    
    /// Title of linked resource.
    let title: String
    
    /// Description of preview.
    let descriptionString: String
    
    /// The type of the preview card.
    let type: PreviewCardType
    
    /// The author of the original resource.
    let authorName: String
    
    /// A link to the author of the original resource.
    let authorUrl: String
    
    /// The provider of the original resource.
    let providerName: String
    
    /// A link to the provider of the original resource.
    let providerUrl: String
    
    /// HTML to be used for generating the preview card.
    let html: String
    
    /// Width of preview, in pixels.
    let width: Int
    
    /// Height of preview, in pixels.
    let height: Int
    
    /// Preview thumbnail.
    let image: String?
    
    /// Used for photo embeds, instead of custom html.
    let embedUrl: String
    
    /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
    let blurhash: String?
}

extension PreviewCard {
    enum PreviewCardType: String, Decodable {
        case link
        case photo
        case video
        case rich
    }
}

extension PreviewCard {
    enum CodingKeys: String, CodingKey {
        case url
        case title
        case descriptionString = "description"
        case type
        case authorName = "author_name"
        case authorUrl = "author_url"
        case providerName = "provider_name"
        case providerUrl = "provider_url"
        case html
        case width
        case height
        case image
        case embedUrl = "embed_url"
        case blurhash
    }
}
