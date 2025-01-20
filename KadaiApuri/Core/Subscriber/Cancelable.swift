//
//  Cancelable.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine

final class Cancelable {
    // MARK: Variables

    fileprivate(set) var subscriptions = Set<AnyCancellable>()

    // MARK: Public Methods

    func cancel() {
        subscriptions.removeAll()
    }
}

extension AnyCancellable {
    func store(in subscriber: Cancelable) {
        subscriber.subscriptions.insert(self)
    }
}
