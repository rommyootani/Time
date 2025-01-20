//
//  CoordinatorProtocol.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import SwiftUI

protocol DestinationProtocol: Equatable {
    associatedtype Destination: View
    var content: Destination { get }
    var transition: Transition { get }
}

protocol CoordinatorProtocol: View {
    associatedtype MainContent: Coordinatable
    associatedtype Destination: DestinationProtocol
    var mainView: MainContent { get }
    var activeRoute: Destination? { get }
}
