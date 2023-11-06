//
//  PieChartView.swift
//  Tax Calculator
//
//  Created by Sarah Clark on 11/6/23.
//

import SwiftUI

struct PieChartView: View {
    let data: [(Double, Color)]

    var body: some View {
        Canvas { context, size in
            let total = data.reduce(0) { $0 + $1.0 }
            context.translateBy(x: size.width * 0.5, y: size.height * 0.5)
            var pieContext = context
            pieContext.rotate(by: .degrees(-90))
            let radius = min(size.width, size.height) * 0.48
            var startAngle = Angle.zero

            for (value, color) in data {
                let angle = Angle(degrees: 360 * (value/total))
                let endAngle = startAngle + angle
                let path = Path { p in
                    p.move(to: .zero)
                    p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                    p.closeSubpath()
                }
                pieContext.fill(path, with:  .color(color))
                startAngle = endAngle
            }
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    PieChartView(data: [(0.3, .red), (0.2, .green), (0.5, .blue)])
}
