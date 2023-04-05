//
//  Box.swift
//  
//
//  Created by John Snow on 05/04/2023.
//

import Foundation

/// class Box is used to box struct inside itself
final class Box<T> {
    let value: T
    
    init(value: T) {
        self.value = value
    }
}

extension Box: Decodable where T: Decodable {
    convenience init(from decoder: Decoder) throws {
        let decodedValue = try T(from: decoder)
        self.init(value: decodedValue)
    }
}
