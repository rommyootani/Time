//
//  TimeDaoMock.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation
@testable import KadaiApuri

final class TimeDaoMock: TimeDaoProtocol {
    // MARK: Variables

    var fetchedRegisterResult: Bool = false
    var fetchedGetAllResult: [KadaiApuri.Time] = []

    // MARK: Public Methods

    func register(someTime _: Int16, startTime _: Int16, endTime _: Int16, result _: Bool) -> Bool {
        return fetchedRegisterResult
    }

    func getAll() -> [KadaiApuri.Time] {
        return fetchedGetAllResult
    }
}
