//
//  MediaAttachment.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

struct MediaAttachment: Decodable {
    /// The ID of the attachment in the database.
    let id: String
    
    /// The type of the attachment.
    let type: AttachmentType
    
    /// The location of the original full-size attachment.
    let url: String
    
    /// The location of a scaled-down preview of the attachment.
    let previewUrl: String?
    
    /// The location of the full-size original attachment on the remote website. Null if the attachment is local
    let remoteUrl: String?
    
    /// Metadata returned by Paperclip.
    let meta: [String: Any]
    
    /// Alternate text that describes what is in the media attachment, to be used for the visually impaired or when media attachments do not load.
    let descriptionString: String?
    
    /// A hash computed by the BlurHash algorithm, for generating colorful preview thumbnails when media has not been downloaded yet.
    let blurhash: String?
}

extension MediaAttachment {
    init(from decoder: Decoder) throws {
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try containter.decode(String.self, forKey: .id)
        self.type = try containter.decode(AttachmentType.self, forKey: .type)
        self.url = try containter.decode(String.self, forKey: .url)
        self.previewUrl = try? containter.decode(String.self, forKey: .previewUrl)
        self.remoteUrl = try? containter.decode(String.self, forKey: .remoteUrl)
        self.meta = try containter.decode([String: Any].self, forKey: .meta)
        self.descriptionString = try? containter.decode(String.self, forKey: .descriptionString)
        self.blurhash = try? containter.decode(String.self, forKey: .blurhash)
    }
}

extension MediaAttachment {
    enum AttachmentType: String, Decodable {
        case unknown
        case image
        case gifv
        case video
        case audio
    }
}

extension MediaAttachment {
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case url
        case previewUrl = "preview_url"
        case remoteUrl = "remote_url"
        case meta
        case descriptionString = "description"
        case blurhash
    }
}
