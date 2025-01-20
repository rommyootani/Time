//
//  Time.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Foundation

struct Time: Hashable {
    var evaluatedTime: Int
    var startTime: Int
    var endTime: Int
    var result: Bool
    var timestamp: Date?
}

extension Time: Equatable {
    static func == (lhs: Time, rhs: Time) -> Bool {
        return lhs.timestamp == rhs.timestamp
    }
}

extension Time {
    static let mock: Time = .init(evaluatedTime: 1, startTime: 4, endTime: 5, result: true, timestamp: Date())
}
