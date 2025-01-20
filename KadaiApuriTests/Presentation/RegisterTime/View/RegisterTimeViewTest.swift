//
//  RegisterTimeViewTest.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 20/01/25.
//

import Combine
@testable import KadaiApuri
import XCTest

final class RegisterTimeViewTest: XCTestCase {
    // MARK: Variables

    private var viewToTest: RegisterTimeView!
    private var viewModelToTest: RegisterTimeViewModel!

    // MARK: Public Methods

    override func setUp() {
        viewModelToTest = KadaiApuri.RegisterTimeViewModel()
        viewToTest = KadaiApuri.RegisterTimeView(viewModel: viewModelToTest)
    }

    func testRegisterTimeView_WhenSomeTimeIsInRange1_ShouldReturnValid() {
        let status = viewToTest.validStatusForData(someTime: 0, startTime: 23, endTime: 1)
        XCTAssertTrue(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsInRange2_ShouldReturnValid() {
        let status = viewToTest.validStatusForData(someTime: 0, startTime: 10, endTime: 6)
        XCTAssertTrue(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsInRange3_ShouldReturnValid() {
        let status = viewToTest.validStatusForData(someTime: 23, startTime: 10, endTime: 6)
        XCTAssertTrue(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsInRange4_ShouldReturnValid() {
        let status = viewToTest.validStatusForData(someTime: 4, startTime: 1, endTime: 9)
        XCTAssertTrue(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsInRange5_ShouldReturnValid() {
        let status = viewToTest.validStatusForData(someTime: 0, startTime: 12, endTime: 6)
        XCTAssertTrue(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsInRange6_ShouldReturnValid() {
        let status = viewToTest.validStatusForData(someTime: 1, startTime: 1, endTime: 9)
        XCTAssertTrue(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsOutOfRange1_ShouldReturnInvalid() {
        let status = viewToTest.validStatusForData(someTime: 0, startTime: 1, endTime: 23)
        XCTAssertFalse(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsOutOfRange2_ShouldReturnInvalid() {
        let status = viewToTest.validStatusForData(someTime: 23, startTime: 1, endTime: 23)
        XCTAssertFalse(status)
    }

    func testRegisterTimeView_WhenSomeTimeIsOutOfRange3_ShouldReturnInvalid() {
        let status = viewToTest.validStatusForData(someTime: 1, startTime: 20, endTime: 23)
        XCTAssertFalse(status)
    }
}
