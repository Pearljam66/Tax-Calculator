//
//  ResultsView.swift
//  Tax Calculator
//
//  Created by Sarah Clark on 11/6/23.
//

import SwiftUI
import SwiftUICharts

struct ResultsView: View {
    var taxBreakdown: [Double] = [5, 10, 15]
    @Binding var salary: String

    var body: some View {
        let salaryNumber = Double(salary)!
        var incomeTax: Double = 0
        var socialSecurityTax: Double = 0

        if (salaryNumber > 11000) {
            if (salaryNumber > 44725) {
                if (salaryNumber > 182100) {
                    incomeTax += (44725 - 11001) * 0.1
                    incomeTax += (182100 - 44726) * 0.12
                    incomeTax += (salaryNumber - 182100) * 0.24
                } else {
                    incomeTax += (44725 - 11001) * 0.1
                    incomeTax += (salaryNumber - 44725) * 0.12
                }
            } else {
                incomeTax += (salaryNumber - 11000) * 0.2
            }
        }
        socialSecurityTax = salaryNumber * 0.0765
        let postTaxSalary = salaryNumber - incomeTax - socialSecurityTax

        let salaryString = String(format:"$%.2F", salaryNumber)
        let postTaxSalaryString = String(format: "$%.2F", postTaxSalary)
        let incomeTaxString = String(format: "$%.2F", incomeTax)
        let socialSecurityTaxString = String(format: "$%.2F", socialSecurityTax)

        let taxBreakdown: [Double] = [postTaxSalary, incomeTax, socialSecurityTax]

       return NavigationView {
            VStack {

                PieChart()
                    .data(taxBreakdown)
                    .chartStyle(ChartStyle(backgroundColor: .white, foregroundColor: ColorGradient(.blue, .purple)))

                Text("Before Tax:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
                    .fontWeight(.bold)

                Text(salaryString)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25))
                    .padding(.vertical)
                Divider()
                    .background(
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 3)
                        )
                Text("After Tax:")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
                    .fontWeight(.bold)

                Text(postTaxSalaryString)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 25))
                    .padding(.vertical)
                Divider()
                    .background(
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 3)
                    )

                Text("Post Tax Salary")
                    .fontDesign(.serif)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                ProgressView(postTaxSalaryString, value: postTaxSalary / salaryNumber * 100, total: 100)
                    .padding(10)
                    .border(.gray, width: 3)
                    .cornerRadius(4)

                Text("Tax")
                    .fontDesign(.serif)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                ProgressView(incomeTaxString, value: incomeTax / salaryNumber * 100, total: 100)
                    .padding(10)
                    .border(.gray, width: 3)
                    .cornerRadius(4)

                Text("Social Security Tax")
                    .fontDesign(.serif)
                    .fontWeight(.heavy)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                ProgressView(socialSecurityTaxString, value: 7.65, total: 100)
                    .padding(10)
                    .border(.gray, width: 3)
                    .cornerRadius(4)
            }
        }
       .padding()
       .navigationTitle("Summary")
    }
}

#Preview {
    ResultsView(salary: .constant("100"))
}
