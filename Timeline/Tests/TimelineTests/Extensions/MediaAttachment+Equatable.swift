//
//  File.swift
//  
//
//  Created by John Snow on 17/04/2023.
//

import Foundation
@testable import Timeline

extension MediaAttachment: Equatable {
    public static func == (lhs: Timeline.MediaAttachment, rhs: Timeline.MediaAttachment) -> Bool {
        lhs.id == rhs.id &&
        lhs.type == rhs.type &&
        lhs.url == rhs.url &&
        lhs.previewUrl == rhs.previewUrl &&
        lhs.remoteUrl == rhs.remoteUrl &&
        lhs.descriptionString == rhs.descriptionString &&
        lhs.blurhash == rhs.blurhash
    }
}
