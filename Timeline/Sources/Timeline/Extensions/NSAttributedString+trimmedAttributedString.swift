//
//  NSAttributedString+trimmedAttributedString.swift
//  
//
//  Created by John Snow on 10/04/2023.
//

import Foundation

extension NSAttributedString {
    /// Removes extra bottom padding from NSAttributedString constructed from html string
    /// - Returns: trimmed NSAttributedString
    func trimmedAttributedString() -> NSAttributedString {
        let nonNewlines = CharacterSet.whitespacesAndNewlines.inverted
        let startRange = string.rangeOfCharacter(from: nonNewlines)
        let endRange = string.rangeOfCharacter(from: nonNewlines, options: .backwards)
        guard let startLocation = startRange?.lowerBound, let endLocation = endRange?.lowerBound else {
            return self
        }
        let range = NSRange(startLocation...endLocation, in: string)
        return attributedSubstring(from: range)
    }
}
