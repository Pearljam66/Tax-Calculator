//
//  ContentView.swift
//  Tax Calculator
//
//  Created by Sarah Clark on 11/6/23.
//

import SwiftUI

struct ContentView: View {
    @State private var salary: String = ""
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            Text("Annual Salary")
                .padding(.bottom, 75)

            TextField("", text: $salary)
                .frame(width: 200)
                .border(borderColor, width: 1)
                .padding(.bottom, 75)
                .keyboardType(.numberPad)

            Button {}
            label: {
                Text("Calculate Tax")
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }

    var borderColor: Color {
        return colorScheme == .dark ? Color.white : Color.black
    }
}

#Preview {
    ContentView()
}
