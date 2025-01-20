//
//  TimeRepository.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation

protocol TimeRepositoryProrocol {
    func registerTime(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool
    func getAll() -> [Time]
}

final class TimeRepository {
    // MARK: Public Methods

    private let database: TimeDaoProtocol

    // MARK: Initializers

    init(database: TimeDaoProtocol = DIContainer.shared.inject(type: TimeDaoProtocol.self)!) {
        self.database = database
    }
}

extension TimeRepository: TimeRepositoryProrocol {
    func registerTime(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool {
        return database.register(someTime: Int16(someTime), startTime: Int16(startTime), endTime: Int16(endTime), result: result)
    }

    func getAll() -> [Time] {
        return database.getAll()
    }
}
