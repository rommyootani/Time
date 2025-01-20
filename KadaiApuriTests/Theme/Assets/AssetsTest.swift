//
//  AssetsTest.swift
//  KadaiApuriTests
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

@testable import KadaiApuri
import XCTest

final class AssetsTest: XCTestCase {
    func testAssetsTest_WhenImageInstanced_ShouldReturnNotNil() throws {
        let name = Assets.splash
        let image = UIImage(named: name)
        XCTAssertNotNil(image)
    }
}
