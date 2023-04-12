//
//  StringProtocol+htmlToAttributed.swift
//  
//
//  Created by John Snow on 10/04/2023.
//

import Foundation

extension StringProtocol {
    /// Converts String with html to AttributedString
    /// - Returns: optional AttributedString
    func htmlToAttributed() -> AttributedString? {
        guard
            let data = data(using: .unicode),
            let nsAttributedString = try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html],
                documentAttributes: nil
            ) else { return nil }
        
        return AttributedString(nsAttributedString.trimmedAttributedString())
    }
}
