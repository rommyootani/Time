//
//  TimeCell.swift
//  KadaiApuri
//
//  Created by rommy cecilia fuentes davila otani on 19/01/25.
//
import SwiftUI

struct TimeCell: View {
    // MARK: Variables

    private var evaluatedTime: Int
    private var startTime: Int
    private var endTime: Int
    private var result: Bool

    // MARK: Life Cycles

    public init(evaluatedTime: Int, startTime: Int, endTime: Int, result: Bool) {
        self.evaluatedTime = evaluatedTime
        self.startTime = startTime
        self.endTime = endTime
        self.result = result
    }

    // MARK: Views

    var body: some View {
        HStack(spacing: 32) {
            VStack {
                Text(String(NSLocalizedString("result_of_evaluation", comment: "")))
                    .fontWeight(.bold)
                ZStack {
                    if result == true {
                        Text(String(NSLocalizedString("include", comment: "")))
                    } else {
                        Text(String(NSLocalizedString("exclude", comment: "")))
                    }
                }
                .frame(width: 100, height: 50)
                .overlay(RoundedRectangle(cornerRadius: 24)
                    .stroke(getBorderColor(), lineWidth: 2))
            }
            VStack(alignment: .center) {
                HStack {
                    Text("\(String(NSLocalizedString("some_time", comment: ""))):")
                        .fontWeight(.bold)
                    Text("\(evaluatedTime)" + String(NSLocalizedString("hour", comment: "")))
                }
                HStack {
                    Text("\(String(NSLocalizedString("start_time", comment: ""))):")
                        .fontWeight(.bold)
                    Text("\(startTime)" + String(NSLocalizedString("hour", comment: "")))
                }
                HStack {
                    Text("\(String(NSLocalizedString("end_time", comment: ""))):")
                        .fontWeight(.bold)
                    Text("\(endTime)" + String(NSLocalizedString("hour", comment: "")))
                }
            }.frame(maxWidth: .infinity)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 32)
    }
}

// MARK: Private Methods

private extension TimeCell {
    func getBorderColor() -> Color {
        return result ? .blue : .red
    }
}
