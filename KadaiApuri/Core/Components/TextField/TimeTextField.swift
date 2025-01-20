//
//  TimeTextField.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//

import SwiftUI

struct TimeTextField: View {
    // MARK: Variables

    private var placeHolder: String

    // MARK: Bindings

    @Binding var value: String
    @Binding var isCorrect: Bool

    // MARK: States

    @State var error: TimeTextFieldError?
    @State var isEmpty: Bool = true

    // MARK: Life Cycles

    public init(placeHolder: String = "", value: Binding<String>, isCorrect: Binding<Bool>) {
        self.placeHolder = placeHolder
        _value = value
        _isCorrect = isCorrect
    }

    public func placeHolder(_ text: String) -> Self {
        Self(placeHolder: text, value: _value, isCorrect: _isCorrect)
    }

    // MARK: Views

    var body: some View {
        VStack(alignment: .leading) {
            labelText
            textField
            messageText
        }
    }

    private var labelText: some View {
        ZStack {
            if !isEmpty {
                Text(placeHolder)
                    .font(.footnote)
                    .foregroundColor(getTextFieldColor())
                    .transition(.move(edge: .bottom).combined(with: .opacity))
                    .animation(.ripple(), value: isEmpty)
            }
        }
    }

    private var textField: some View {
        ZStack {
            TextField(placeHolder, text: $value)
                .onChange(of: value) { text in
                    changeIsEmptyStatusWithText(text)
                    guard !isEmpty else {
                        changeIsCorrectStatus(false, error: nil)
                        return
                    }
                    guard text.isOnlyNumbers else {
                        changeIsCorrectStatus(false, error: .invalidValue)
                        return
                    }
                    guard text.isHourNumbers else {
                        changeIsCorrectStatus(false, error: .invalidRangeValue)
                        return
                    }
                    changeIsCorrectStatus(true, error: nil)
                }
                .foregroundColor(.black)
                .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                .overlay(RoundedRectangle(cornerRadius: 8)
                    .stroke(getTextFieldColor(), lineWidth: 1))
                .keyboardType(.numberPad)
        }
        .animation(.default, value: isEmpty)
    }

    private var messageText: some View {
        ZStack {
            if error != nil {
                Text(error?.localizedText ?? "")
                    .font(.footnote)
                    .foregroundColor(getTextFieldColor())
            }
        }
    }
}

// MARK: Private Methods

private extension TimeTextField {
    func getTextFieldColor() -> Color {
        return error == nil ? .gray : .red
    }

    func changeIsEmptyStatusWithText(_ text: String) {
        withAnimation(.ripple()) {
            isEmpty = text.isEmpty
        }
    }

    func changeIsCorrectStatus(_ status: Bool, error: TimeTextFieldError?) {
        self.error = error
        isCorrect = status
    }
}
