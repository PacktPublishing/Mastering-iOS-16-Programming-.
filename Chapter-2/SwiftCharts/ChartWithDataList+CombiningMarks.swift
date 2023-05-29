//
//  ChartWithDataList+CombiningMarks.swift
//  SwiftCharts
//
//  Created by Kamyar Elyasi on 22-May-23.
//

import SwiftUI
import Charts

struct InflationPercent: Identifiable {
    var id = UUID()
    var month: String
    var value: Double
}

struct InflationChart: View {
    let data: [InflationPercent] = [
        InflationPercent(month: "Jan", value: 5),
        InflationPercent(month: "Feb", value: 4),
        InflationPercent(month: "Mar", value: 7),
        InflationPercent(month: "Apr", value: 12),
        InflationPercent(month: "May", value: 8),
        InflationPercent(month: "Jun", value: 16),
        InflationPercent(month: "Jul", value: 9)
    ]
        
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Month", $0.month),
                y: .value("Value", $0.value)
            )
            PointMark(
                x: .value("Month", $0.month),
                y: .value("Value", $0.value)
            ).foregroundStyle(.red)
        }
        .frame(height: 250)
        .padding()
    }
}

struct InflationChart_Previews: PreviewProvider {
    static var previews: some View {
        InflationChart()
    }
}
