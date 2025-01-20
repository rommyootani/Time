//
//  KadaiApuriApp.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import SwiftUI

@main
struct KadaiApuriApp: App {
    // MARK: Initializers

    init() {
        DIContainer.shared.registration()
    }

    // MARK: Scene

    var body: some Scene {
        WindowGroup {
            TimeListCoordinator(viewModel: TimeListViewModel())
        }
    }
}
