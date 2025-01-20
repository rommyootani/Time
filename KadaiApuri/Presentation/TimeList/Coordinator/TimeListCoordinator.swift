//
//  TimeListCoordinator.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//
import Combine
import SwiftUI

struct TimeListCoordinator: CoordinatorProtocol {
    // MARK: Variable

    let subscriber = Cancelable()

    // MARK: StateObject

    @StateObject var viewModel: TimeListViewModel

    // MARK: State

    @State var activeRoute: Destination?
    @State private var isLoaded: Bool = .init()
    @State var transition: Transition?

    // MARK: View

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

    var mainView: TimeListView {
        return TimeListView(viewModel: viewModel)
    }
}

// MARK: View Builder

extension TimeListCoordinator {
    struct Destination: DestinationProtocol {
        var route: TimeListView.Routes
        @ViewBuilder
        var content: some View {
            switch route {
            case .add:
                RegisterTimeView(viewModel: RegisterTimeViewModel())
            }
        }

        var transition: Transition {
            switch route {
            case .add: return .push
            }
        }
    }
}
