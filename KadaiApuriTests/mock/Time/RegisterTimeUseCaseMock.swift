//
//  RegisterTimeUseCaseMock.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation
@testable import KadaiApuri

final class RegisterTimeUseCaseMock: KadaiApuri.RegisterTimeUseCaseProtocol {
    let mockTimeRepisitory = TimeRepositoryMock()
    func execute(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool {
        return mockTimeRepisitory.registerTime(someTime: someTime, startTime: startTime, endTime: endTime, result: result)
    }
}
