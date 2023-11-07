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
                Text("Annual Salary")
                    .padding(.bottom, 75)

                TextField("", text: $salary)
                    .frame(width: 200)
                    .border(borderColor, width: 1)
                    .padding(.bottom, 75)
                    .keyboardType(.numberPad)

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
