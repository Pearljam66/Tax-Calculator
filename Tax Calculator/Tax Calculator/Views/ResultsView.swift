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
        VStack {
            Text("Summary")
                .font(.system(size: 36))
                .fontWeight(.bold)

            PieChart()
                .data(taxBreakdown)
                .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(.blue, .purple)))

                Text("Before Tax:")
                    .font(.system(size: 32))
                    .padding(.vertical)
                Text("$100,000")
                    .font(.system(size: 32))
                    .padding(.vertical)
                Text("After Tax:")
                    .font(.system(size: 32))
                    .padding(.vertical)
                Text("$75,000")
                    .font(.system(size: 32))
                    .padding(.vertical)

                Text("Post Tax Salary")
                ProgressView("", value: 20, total: 100)

                Text("Tax")
                ProgressView("", value: 20, total: 100)

                Text("Social Security Tax")
                ProgressView("", value: 20, total: 100)
        }
        .padding()
    }
}

#Preview {
    ResultsView()
}
