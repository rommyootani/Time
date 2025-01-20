//
//  TimeZoneExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

@testable import KadaiApuri
import XCTest

final class TimeZoneExtensionTest: XCTestCase {
    func testTimeZoneTest_WhenTimeZoneJapanInstanced_ShouldHaveValidIdentifier() throws {
        let timezone = TimeZone.japan
        let text = timezone.identifier
        XCTAssertEqual(text, "Asia/Tokyo")
    }
}
