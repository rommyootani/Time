//
//  RegisterTimeViewModel.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation

protocol RegisterTimeViewModelProtocol {
    func registerTime(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool
    func getAll() -> [Time]
}

protocol DefaultRegisterTimeViewModel: RegisterTimeViewModelProtocol {}

final class RegisterTimeViewModel: DefaultViewModel, DefaultRegisterTimeViewModel {
    // MARK: Public Methods

    let title: String = .init(NSLocalizedString("title_time_register", comment: ""))
    private let registerTimeUseCase: RegisterTimeUseCaseProtocol
    var navigateSubject = PassthroughSubject<RegisterTimeView.Routes, Never>()

    // MARK: Initializers

    init(registerTimeUseCase: RegisterTimeUseCaseProtocol = DIContainer.shared.inject(type: RegisterTimeUseCaseProtocol.self)!) {
        self.registerTimeUseCase = registerTimeUseCase
    }
}

extension RegisterTimeViewModel: DataFlowProtocol {
    // MARK: Variables

    typealias InputType = Load
    enum Load {
        case onAppear
    }

    // MARK: Private Methods

    private func bindData() {}

    // MARK: Public Methods

    func apply(_ input: Load) {
        switch input {
        case .onAppear:
            bindData()
        }
    }

    func registerTime(someTime: Int, startTime: Int, endTime: Int, result: Bool) -> Bool {
        registerTimeUseCase.execute(someTime: someTime, startTime: startTime, endTime: endTime, result: result)
    }

    func getAll() -> [Time] {
        return []
    }
}
