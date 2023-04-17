//
//  ImageMeta+Equatable.swift
//  
//
//  Created by John Snow on 17/04/2023.
//

import Foundation
@testable import Timeline

extension ImageMeta.ImageSize: Equatable {
    public static func == (lhs: ImageMeta.ImageSize, rhs: ImageMeta.ImageSize) -> Bool {
        lhs.width == rhs.width && lhs.height == rhs.height
    }
}

extension ImageMeta: Equatable {
    public static func == (lhs: Timeline.ImageMeta, rhs: Timeline.ImageMeta) -> Bool {
        lhs.small == rhs.small && lhs.original == rhs.original
    }
}
