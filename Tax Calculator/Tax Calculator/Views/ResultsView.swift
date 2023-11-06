//
//  ResultsView.swift
//  Tax Calculator
//
//  Created by Sarah Clark on 11/6/23.
//

import SwiftUICharts
import SwiftUI

struct ResultsView: View {
    var taxBreakdown: [Double] = [5, 10, 15]

    var body: some View {
        PieChart()
            .data(taxBreakdown)
            .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(.blue, .purple)))
    }
}

#Preview {
    ResultsView()
}
