//
//  ImageMeta.swift
//  
//
//  Created by John Snow on 14/04/2023.
//

import Foundation

struct ImageMeta {
    let small: ImageSize
    let original: ImageSize
    
    init?(jsonDictionary: [String: Any]) {
        let smallContainer = jsonDictionary["small"] as? [String: Any]
        let originalContainer = jsonDictionary["original"] as? [String: Any]
        
        guard
            let smallWidth = smallContainer?["width"] as? Int,
            let smallHeight = smallContainer?["height"] as? Int,
            let originalWidth = originalContainer?["width"] as? Int,
            let originalHeight = originalContainer?["height"] as? Int
        else {
            return nil
        }
        
        self.small = ImageSize(width: smallWidth, height: smallHeight)
        self.original = ImageSize(width: originalWidth, height: originalHeight)
    }
    
    struct ImageSize {
        let width: Int
        let height: Int
    }
}

extension ImageMeta {
    static let stubData = ImageMeta(jsonDictionary: [
        "small": ["width": 480, "height": 480],
        "original": ["width": 1080, "height": 1080]
    ])
}
