//
//  String + Extension.swift
//  EasyCrypto
//
//  Created by Mehran on 11/15/1401 AP.
//

import Foundation

extension String {
    // MARK: Public Methods

    func regex(pattern: String) -> [String] {
        do {
            let regex = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options(rawValue: 0))
            let nsstr = self as NSString
            let all = NSRange(location: 0, length: nsstr.length)
            var matches = [String]()
            regex.enumerateMatches(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: all) { (result: NSTextCheckingResult?, _, _) in
                if let new = result {
                    let result = nsstr.substring(with: new.range) as String
                    matches.append(result)
                }
            }
            return matches
        } catch {
            return [String]()
        }
    }
}

extension String {
    // MARK: Variables

    var isOnlyNumbers: Bool {
        let numbersSet = CharacterSet(charactersIn: "0123456789")
        let textCharacterSet = CharacterSet(charactersIn: self)
        return textCharacterSet.isSubset(of: numbersSet)
    }

    var isHourNumbers: Bool {
        guard let intValue = Int(self), intValue < 24 else { return false }
        let matched = regex(pattern: "^([0-9]{1}|([1-9]{1}[0-9]{1}))$")
        return matched.first == self
    }
}
