//
//  ResultsView.swift
//  Tax Calculator
//
//  Created by Sarah Clark on 11/6/23.
//

import SwiftUI

struct ResultsView: View {
    var taxBreakdown: [Double] = [5, 10, 15]

    var body: some View {
        let taxData: [(Double, Color)] = taxBreakdown.enumerated().map { index, value in
            return (value, colorForValue(Double(index)))
        }

        PieChartView(data: taxData)
    }

    func colorForValue(_ index: Double) -> Color {
        if index == 0 {
            return .gray
        } else if index == 1 {
            return .blue
        } else {
            return .pink
        }
    }
}

#Preview {
    ResultsView()
}
