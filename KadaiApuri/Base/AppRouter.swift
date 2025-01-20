//
//  AppRouter.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import SwiftUI

enum Transition {
    case push
    case bottomSheet
    case url
}

struct AppRouter<Destination: DestinationProtocol>: ViewModifier {
    // MARK: Variables

    var destinationView: some View {
        destination?.content
    }

    // MARK: Binding

    @Binding var destination: Destination?

    // MARK: State

    @State var isLinkActive = false
    @State var isURLActive = false
    @State var isBottomSheetActive = false

    // MARK: Views

    func body(content: Content) -> some View {
        ZStack {
            NavigationLink(
                destination: destinationView,
                isActive: $isLinkActive, label: {}
            )
            content
        }.sheet(isPresented: $isURLActive, content: { destinationView })
            .sheet(isPresented: $isBottomSheetActive, content: { destinationView })
            .onChange(of: destination, perform: { _ in routeChanged() })
            .onChange(of: isLinkActive, perform: { _ in routeDismissed() })
            .onChange(of: isURLActive, perform: { _ in routeDismissed() })
            .onChange(of: isBottomSheetActive, perform: { _ in routeDismissed() })
    }

    // MARK: Public Methods

    func routeDismissed() {
        if !isLinkActive && !isURLActive && !isBottomSheetActive {
            destination = nil
        }
    }

    func routeChanged() {
        guard let destination = destination else { return }
        isLinkActive = destination.transition == .push
        isBottomSheetActive = destination.transition == .bottomSheet
        isURLActive = destination.transition == .url
    }
}

struct Navigator: ViewModifier {
    func body(content: Content) -> some View {
        NavigationView {
            content
        }
    }
}

extension View {
    func route<Destination: DestinationProtocol>(to destination: Binding<Destination?>) -> some View {
        modifier(AppRouter(destination: destination))
    }

    func navigation() -> some View {
        modifier(Navigator())
    }
}
