//
//  BaseViewModel.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import Foundation

enum ViewModelStatus: Equatable {
    case loadStart
    case dismissAlert
    case emptyStateHandler
    case showAlert(title: String? = nil)
}

protocol BaseViewModelEventSource: AnyObject {
    var loadinState: CurrentValueSubject<ViewModelStatus, Never> { get }
}

protocol ViewModelService: AnyObject {}

typealias BaseViewModel = BaseViewModelEventSource & ViewModelService

open class DefaultViewModel: BaseViewModel, ObservableObject {
    // MARK: Variables

    var loadinState = CurrentValueSubject<ViewModelStatus, Never>(.dismissAlert)
}
