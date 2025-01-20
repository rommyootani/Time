//
//  TimeListView.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//
import Combine
import SwiftUI

struct TimeListView: Coordinatable {
    // MARK: Variables

    typealias Route = Routes
    let subscriber = Cancelable()
    enum Routes: Routing {
        case add
    }

    // MARK: ObservedObjects

    @ObservedObject private(set) var viewModel: TimeListViewModel

    // MARK: States

    @State private var isLoading: Bool = false
    @State private var items: [Time] = []

    // MARK: Life Cycles

    init(viewModel: TimeListViewModel = DIContainer.shared.inject(type: TimeListViewModel.self)!) {
        self.viewModel = viewModel
    }

    // MARK: Views

    var body: some View {
        NavigationView {
            ScrollView {
                ForEach($items.wrappedValue, id: \.self) { item in
                    TimeCell(evaluatedTime: item.evaluatedTime, startTime: item.startTime, endTime: item.endTime, result: item.result)
                    Divider()
                }
            }
            .onAppear(perform: {
                items = viewModel.getAll()
            })
            .toolbar {
                ToolbarItem {
                    Button(action: onClickAddItem) {
                        Text(LocalizedStringKey("add"))
                    }
                }
            }.onViewDidLoad {
                self.viewModel.apply(.onAppear)
            }
        }
        .onAppear(perform: handleState)
    }
}

// MARK: Private Methods

private extension TimeListView {
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
                case .showAlert:
                    self.isLoading = false
                }
            }.store(in: subscriber)
    }

    func onClickAddItem() {
        viewModel.navigateSubject.send(Route.add)
    }
}

#if DEBUG
    struct TimeListView_Previews: PreviewProvider {
        static var previews: some View {
            TimeListView(viewModel: TimeListViewModel())
        }
    }
#endif
