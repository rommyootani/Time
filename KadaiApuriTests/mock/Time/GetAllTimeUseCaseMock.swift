//
//  GetAllTimeUseCaseMock.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation
@testable import KadaiApuri

final class GetAllTimeUseCaseMock: KadaiApuri.GetAllTimeUseCaseProtocol {
    let mockTimeRepisitory = TimeRepositoryMock()
    func execute() -> [KadaiApuri.Time] {
        return mockTimeRepisitory.getAll()
    }
}
