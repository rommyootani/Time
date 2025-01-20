//
//  AppDependencyContainer + Injection.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Foundation

extension DIContainer {
    func registration() {
        register(type: TimeDaoProtocol.self, component: TimeDao())
        register(type: TimeRepositoryProrocol.self, component: TimeRepository())
        register(type: RegisterTimeUseCaseProtocol.self, component: RegisterTimeUseCase())
        register(type: GetAllTimeUseCaseProtocol.self, component: GetAllTimeUseCase())
    }
}
