//
//  LocaleExtensionTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

@testable import KadaiApuri
import XCTest

final class LocaleExtensionTest: XCTestCase {
    func testLocaleExtensionTest_WhenLocaleJapanInstanced_ShouldHaveValidIdentifier() throws {
        let locale = Locale.japan
        let text = locale.identifier
        XCTAssertEqual(text, "ja_JP")
    }
}
