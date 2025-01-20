//
//  CancelableTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

@testable import KadaiApuri
import XCTest

final class CancelableTest: XCTestCase {
    func testCancelableTest_WhenCancelableCallCancel_ShouldReturnZero() throws {
        let subscriber = Cancelable()
        subscriber.cancel()
        XCTAssertEqual(subscriber.subscriptions.count, 0)
    }
}
