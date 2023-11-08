//
//  ContentView.swift
//  Tax Calculator
//
//  Created by Sarah Clark on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var salary: String = ""
    @State private var isSalaryValid: Bool = false

    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        NavigationView {
            VStack {
                Text("Annual Salary:")
                    .padding(.bottom, 25)
                    .font(.system(size: 30))

                TextField("cash money", text: $salary)
                    .frame(width: 150, height: 30)
                    .border(borderColor, width: 3)
                    .cornerRadius(5)
                    .padding(.bottom, 75)
                    .keyboardType(.decimalPad)

                NavigationLink(destination: ResultsView(salary:$salary), isActive: $isSalaryValid, label: {
                    Text("Calculate Tax")
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            goToResultsView()
                        }
                })
            }
            .padding()
            .navigationTitle("Main Page")
        }

    }

        func goToResultsView() {
            if (Float(salary) != nil) {
                if (Float(salary)! > 0) {
                    isSalaryValid = true
                }
            }
        }

    var borderColor: Color {
        return colorScheme == .dark ? Color.white : Color.black
    }
}

#Preview {
    ContentView()
}
