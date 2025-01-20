//
//  TimeTextFieldError.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//
import Foundation

enum TimeTextFieldError: String {
    // MARK: Cases

    case invalidValue
    case invalidRangeValue

    // MARK: Public Methods

    var localizedText: String {
        switch self {
        case .invalidValue:
            return String(NSLocalizedString("invalid_value", comment: ""))
        case .invalidRangeValue:
            return String(NSLocalizedString("invalid_range_value", comment: ""))
        }
    }
}
