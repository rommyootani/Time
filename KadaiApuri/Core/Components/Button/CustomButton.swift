//
//  CustomButton.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//
import SwiftUI

struct CustomButton: View {
    // MARK: Variables

    var title: String
    var onClick: () -> Void

    // MARK: Bindings

    @Binding var enable: Bool

    // MARK: Life Cycles

    public init(title: String = "", enable: Binding<Bool>, onClick: @escaping () -> Void) {
        self.title = title
        _enable = enable
        self.onClick = onClick
    }

    // MARK: Views

    var body: some View {
        VStack(alignment: .leading) {
            Button {
                onClick()
            } label: {
                Text(title)
                    .frame(maxWidth: .infinity)
                    .padding(EdgeInsets(top: 12, leading: 16, bottom: 12, trailing: 16))
                    .foregroundColor(getButtonColor())
                    .overlay(RoundedRectangle(cornerRadius: 24)
                        .stroke(getButtonColor(), lineWidth: 2))
            }
            .contentShape(Rectangle())
            .disabled(!enable)
        }
    }
}

// MARK: Private Methods

private extension CustomButton {
    func getButtonColor() -> Color {
        return enable ? .blue : .gray
    }
}
