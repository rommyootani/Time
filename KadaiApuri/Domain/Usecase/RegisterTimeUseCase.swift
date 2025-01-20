//
//  RegisterTimeUseCase.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation

protocol RegisterTimeUseCaseProtocol: AnyObject {
    func execute(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool
}

final class RegisterTimeUseCase: RegisterTimeUseCaseProtocol {
    // MARK: Variables

    private let timeRepository: TimeRepositoryProrocol

    // MARK: Initializers

    init(timeRepository: TimeRepositoryProrocol = DIContainer.shared.inject(type: TimeRepositoryProrocol.self)!) {
        self.timeRepository = timeRepository
    }

    // MARK: Public Methods

    func execute(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool {
        timeRepository.registerTime(someTime: someTime, startTime: startTime, endTime: endTime, result: result)
    }
}
