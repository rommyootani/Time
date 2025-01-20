//
//  DataFlowProtocol.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Foundation

protocol DataFlowProtocol {
    // MARK: Variables

    associatedtype InputType

    // MARK: Public Methods

    func apply(_ input: InputType)
}
