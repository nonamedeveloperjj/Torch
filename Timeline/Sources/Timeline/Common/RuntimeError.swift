//
//  MappingError.swift
//  
//
//  Created by John Snow on 11/04/2023.
//

import Foundation

struct RuntimeError: LocalizedError {
    let description: String

    init(_ description: String) {
        self.description = description
    }
}
