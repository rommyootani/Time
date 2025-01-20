//
//  TimeRepositoryMock.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation
@testable import KadaiApuri

final class TimeRepositoryMock: KadaiApuri.TimeRepositoryProrocol {
    let mockTimeService = TimeDaoMock()
    func registerTime(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool {
        return mockTimeService.register(someTime: Int16(someTime), startTime: Int16(startTime), endTime: Int16(endTime), result: result)
    }

    func getAll() -> [Time] {
        return mockTimeService.getAll()
    }
}
