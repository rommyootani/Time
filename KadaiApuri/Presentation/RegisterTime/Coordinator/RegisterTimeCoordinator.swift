//
//  RegisterTimeCoordinator.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import SwiftUI

struct RegisterTimeCoordinator: CoordinatorProtocol {
    // MARK: Variables

    let subscriber = Cancelable()

    // MARK: StateObjects

    @StateObject var viewModel: RegisterTimeViewModel

    // MARK: States

    @State var activeRoute: Destination?
    @State var transition: Transition?
    @State private var isLoaded: Bool = .init()

    // MARK: Views

    var body: some View {
        mainView
            .route(to: $activeRoute)
            .navigation()
            .onAppear {
                self.mainView.viewModel.navigateSubject
                    .sink { route in
                        activeRoute = Destination(route: route)
                    }.store(in: subscriber)
            }
    }

    var mainView: RegisterTimeView {
        return RegisterTimeView(viewModel: viewModel)
    }
}

// MARK: View Builders

extension RegisterTimeCoordinator {
    struct Destination: DestinationProtocol {
        var route: RegisterTimeView.Routes
        @ViewBuilder
        var content: some View {
            switch route {
            case .back:
                TimeListView(viewModel: TimeListViewModel())
            }
        }

        var transition: Transition {
            switch route {
            case .back: return .push
            }
        }
    }
}
