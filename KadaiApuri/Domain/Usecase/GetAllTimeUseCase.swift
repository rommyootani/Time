//
//  GetAllTimeUseCase.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation

protocol GetAllTimeUseCaseProtocol: AnyObject {
    func execute() -> [Time]
}

final class GetAllTimeUseCase: GetAllTimeUseCaseProtocol {
    // MARK: Variables

    private let timeRepository: TimeRepositoryProrocol
    var subscriber = Cancelable()

    // MARK: Initializers

    init(timeRepository: TimeRepositoryProrocol = DIContainer.shared.inject(type: TimeRepositoryProrocol.self)!) {
        self.timeRepository = timeRepository
    }

    // MARK: Public Methods

    func execute() -> [Time] {
        timeRepository.getAll()
    }
}
