//
//  String+extension.swift
//  YProjet
//
//  Created by cristina.virlan on 01/05/2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
      return prefix(1).uppercased() + self.dropFirst()
    }

    /// Makes all text lowercased and applies uppercase only on first letter
    /// - Returns: a string containing the text processed
    func capitalizeOnlyFirstLetter() -> String {
        return self.lowercased().capitalizingFirstLetter()
    }

    mutating func capitalizeFirstLetter() {
      self = self.capitalizingFirstLetter()
    }

    func trimLinesAndWhiteSpaces() -> String {
        return self.components(separatedBy: .whitespacesAndNewlines).filter { !$0.isEmpty }.joined(separator: " ")
    }

    func isNumeric() -> Bool {
        let regex = "(-)?(\\d)+"
        return NSPredicate(format: "SELF MATCHES %@", regex).evaluate(with: self)
    }

    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

