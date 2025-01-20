//
//  AppDependencyContainer.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Foundation

protocol DIContainerProtocol {
    func register<Service>(type: Service.Type, component: Any)
    func inject<Service>(type: Service.Type) -> Service?
}

final class DIContainer: DIContainerProtocol {
    // MARK: Variables

    static let shared = DIContainer()
    var services: [String: Any] = [:]

    // MARK: Initializers

    private init() {}

    // MARK: Public Methods

    func register<Service>(type: Service.Type, component service: Any) {
        services["\(type)"] = service
    }

    func inject<Service>(type: Service.Type) -> Service? {
        return services["\(type)"] as? Service
    }
}
