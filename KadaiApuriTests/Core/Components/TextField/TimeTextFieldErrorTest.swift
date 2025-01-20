//
//  TimeTextFieldErrorTest.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 20/01/25.
//

@testable import KadaiApuri
import XCTest

final class TimeTextFieldErrorTest: XCTestCase {
    func testTimeTextFieldErrorTest_WhenIsInvalidValue_ShouldReturnMessage() throws {
        let message = String(NSLocalizedString("invalid_value", comment: ""))
        let txtMessage = KadaiApuri.TimeTextFieldError.invalidValue.localizedText
        XCTAssertEqual(message, txtMessage)
    }

    func testTimeTextFieldErrorTest_WhenIsInvalidRangeValue_ShouldReturnMessage() throws {
        let message = String(NSLocalizedString("invalid_range_value", comment: ""))
        let txtMessage = KadaiApuri.TimeTextFieldError.invalidRangeValue.localizedText
        XCTAssertEqual(message, txtMessage)
    }
}
