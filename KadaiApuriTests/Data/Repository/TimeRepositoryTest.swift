//
//  TimeRepositoryTest.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

@testable import KadaiApuri
import XCTest

final class TimeRepositoryTest: XCTestCase {
    // MARK: Variables

    var sut: Time!

    // MARK: Public Methods

    override func setUp() {
        sut = Time.mock
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testConformTo_Hashable() {
        XCTAssertTrue(sut as Any is (any Hashable))
    }

    func testConformTo_Equtable() {
        XCTAssertEqual(sut, sut)
    }

    func testTime_ShouldReturnValidType() {
        XCTAssertTrue(sut.evaluatedTime == 1)
        XCTAssertTrue(sut.startTime == 4)
        XCTAssertTrue(sut.endTime == 5)
        XCTAssertTrue(sut.result == true)
        XCTAssertNotNil(sut.timestamp)
    }
}
