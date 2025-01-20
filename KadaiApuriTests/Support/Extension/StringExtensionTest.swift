//
//  StringExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

@testable import KadaiApuri
import XCTest

final class StringExtensionTest: XCTestCase {
    func testStringExtensionTest_WhenStringIsHourNumbers_ShouldReturnValidType() {
        let hourString = "23"
        let status = hourString.isHourNumbers
        XCTAssertTrue(status)
    }

    func testStringExtensionTest_WhenStringIsHourNumbers_ShouldReturnInvalidType() {
        let hourString = "fd"
        let status = hourString.isHourNumbers
        XCTAssertFalse(status)
    }

    func testStringExtensionTest_WhenStringIsOnlyNumbers_ShouldReturnValidType() {
        let hourString = "347943729"
        let status = hourString.isOnlyNumbers
        XCTAssertTrue(status)
    }

    func testStringExtensionTest_WhenStringIsOnlyNumbers_ShouldReturnInvalidType() {
        let hourString = "efr3"
        let status = hourString.isOnlyNumbers
        XCTAssertFalse(status)
    }

    func testStringExtensionTest_WhenUsingRegex_ShouldReturnValidType() {
        let hourString = "4"
        let matched = hourString.regex(pattern: "^([0-9]{1}|([1-9]{1}[0-9]{1}))$")
        XCTAssertTrue(matched.first == hourString)
    }

    func testStringExtensionTest_WhenUsingRegex_ShouldReturnInvalidType() {
        let hourString = "2332432"
        let matched = hourString.regex(pattern: "^([0-9]{1}|([1-9]{1}[0-9]{1}))$")
        XCTAssertFalse(matched.first == hourString)
    }
}
