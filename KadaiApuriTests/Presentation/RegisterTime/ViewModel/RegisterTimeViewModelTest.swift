//
//  RegisterTimeViewModelTest.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
@testable import KadaiApuri
import XCTest

final class RegisterTimeViewModelTest: XCTestCase {
    // MARK: Variables

    private var viewModelToTest: RegisterTimeViewModel!
    private var dao: TimeDaoMock!
    private var subscriber: Set<AnyCancellable> = []
    private var input: KadaiApuri.TimeListViewModel.InputType!

    // MARK: Public Methods

    override func setUp() {
        viewModelToTest = KadaiApuri.RegisterTimeViewModel()
        dao = TimeDaoMock()
        input = KadaiApuri.TimeListViewModel.InputType.onAppear
    }

    override func tearDown() {
        subscriber.forEach { $0.cancel() }
        subscriber.removeAll()
        viewModelToTest = nil
        dao = nil
        input = nil
        super.tearDown()
    }

    func testRegisterTimeViewModel_WhenServiceCalled_ShouldReturnResponse() {
        let expectation = XCTestExpectation(description: "State")
        viewModelToTest.loadinState.dropFirst().sink { event in
            XCTAssertEqual(event, .loadStart)
            expectation.fulfill()
        }.store(in: &subscriber)
        let data = viewModelToTest.registerTime(someTime: 1, startTime: 1, endTime: 1, result: false)
        XCTAssertTrue(data)
    }
}
