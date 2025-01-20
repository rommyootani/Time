//
//  RegisterTimeView.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import Combine
import SwiftUI

struct RegisterTimeView: Coordinatable {
    // MARK: Variables

    typealias Route = Routes
    let subscriber = Cancelable()
    var anyOfMultiple: [Bool] {
        [isCorrectStartTime == true,
         isCorrectEvaluatedTime == true,
         isCorrectEndTime == true]
    }

    enum Routes: Routing {
        case back
    }

    // MARK: ObservedObjects

    @ObservedObject private(set) var viewModel: RegisterTimeViewModel

    // MARK: States

    @State private var isLoading: Bool = false
    @State private var presentAlert = false
    @State private var alertMesage: String = ""
    @State private var evaluatedTime: String = ""
    @State private var endTime: String = ""
    @State private var startTime: String = ""
    @State private var isCorrectEvaluatedTime: Bool = false
    @State private var isCorrectEndTime: Bool = false
    @State private var isCorrectStartTime: Bool = false
    @State private var isEnableButton: Bool = false

    // MARK: Life Cycles

    init(viewModel: RegisterTimeViewModel = DIContainer.shared.inject(type: RegisterTimeViewModel.self)!) {
        self.viewModel = viewModel
    }

    // MARK: Views

    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                VStack(spacing: 32) {
                    Text(LocalizedStringKey("indication_for_registration"))
                    TimeTextField(placeHolder: String(NSLocalizedString("some_time", comment: "")), value: $evaluatedTime, isCorrect: $isCorrectEvaluatedTime)
                    TimeTextField(placeHolder: String(NSLocalizedString("start_time", comment: "")), value: $startTime, isCorrect: $isCorrectStartTime)
                    TimeTextField(placeHolder: String(NSLocalizedString("end_time", comment: "")), value: $endTime, isCorrect: $isCorrectEndTime)
                    CustomButton(title: String(NSLocalizedString("to_evaluate", comment: "")), enable: $isEnableButton, onClick: submit)
                    Spacer()
                }.alert(isPresented: $presentAlert) {
                    Alert(
                        title: Text(alertMesage)
                    )
                }
                if isLoading {
                    CustomActivityIndicator()
                }
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 32)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onChange(of: anyOfMultiple) { _ in
                isEnableButton = getEnableStatusToButton()
            }.onViewDidLoad {
                self.viewModel.apply(.onAppear)
            }
        }
        .onAppear(perform: handleState)
    }
}

// MARK: Private Methods

private extension RegisterTimeView {
    func handleState() {
        viewModel.loadinState
            .receive(on: WorkScheduler.mainThread)
            .sink { state in
                switch state {
                case .loadStart:
                    self.isLoading = true
                case .dismissAlert:
                    self.isLoading = false
                case .emptyStateHandler:
                    self.isLoading = false
                    self.presentAlert = false
                    self.alertMesage = ""
                case let .showAlert(message):
                    self.isLoading = false
                    self.presentAlert = true
                    self.alertMesage = message ?? ""
                }
            }.store(in: subscriber)
    }

    func getEnableStatusToButton() -> Bool {
        return isCorrectStartTime && isCorrectEndTime && isCorrectEvaluatedTime
    }

    func submit() {
        viewModel.loadinState.value = .loadStart
        guard let startTime = Int(startTime), let endTime = Int(endTime), let someTime = Int(evaluatedTime) else {
            return
        }
        let status = validStatusForData(someTime: someTime, startTime: startTime, endTime: endTime)
        let result = viewModel.registerTime(someTime: someTime, startTime: startTime, endTime: endTime, result: status)
        if result {
            cleanAllInputs()
        }
        viewModel.loadinState.value = .showAlert(title: getAlertMessage(result: result))
    }

    func cleanAllInputs() {
        evaluatedTime = ""
        endTime = ""
        startTime = ""
    }

    func getAlertMessage(result: Bool) -> String {
        if result {
            return String(NSLocalizedString("message_register_success", comment: ""))
        } else {
            return String(NSLocalizedString("message_register_error", comment: ""))
        }
    }
}

// MARK: Public Methods

extension RegisterTimeView {
    func validStatusForData(someTime: Int, startTime: Int, endTime: Int) -> Bool {
        if startTime == endTime {
            return true
        } else if endTime < startTime {
            return someTime >= startTime || someTime < endTime
        } else {
            return someTime >= startTime && someTime < endTime
        }
    }
}

#if DEBUG
    struct RegisterTimeView_Previews: PreviewProvider {
        static var previews: some View {
            RegisterTimeView(viewModel: RegisterTimeViewModel())
        }
    }
#endif
