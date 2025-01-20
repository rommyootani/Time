//
//  Animation + Extension.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import SwiftUICore

extension Animation {
    // MARK: Public Methods

    static func ripple() -> Animation {
        Animation.spring(dampingFraction: 0.5)
            .speed(2)
            .delay(0.02)
    }
}
