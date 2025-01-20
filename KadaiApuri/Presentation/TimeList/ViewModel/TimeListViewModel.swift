//
//  RegisterTimeViewModel.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//
import Combine
import Foundation

protocol TimeListViewModelProtocol {
    func getAll() -> [Time]
}

protocol DefaultTimeListViewModel: TimeListViewModelProtocol {}

final class TimeListViewModel: DefaultViewModel, DefaultTimeListViewModel {
    // MARK: Variables

    let title: String = .init(NSLocalizedString("title_time_list", comment: ""))
    private let getAllTimeUseCase: GetAllTimeUseCaseProtocol
    var navigateSubject = PassthroughSubject<TimeListView.Routes, Never>()

    // MARK: Initializers

    init(getAllTimeUseCase: GetAllTimeUseCaseProtocol = DIContainer.shared.inject(type: GetAllTimeUseCaseProtocol.self)!) {
        self.getAllTimeUseCase = getAllTimeUseCase
    }
}

extension TimeListViewModel: DataFlowProtocol {
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

    func getAll() -> [Time] {
        return getAllTimeUseCase.execute()
    }
}
