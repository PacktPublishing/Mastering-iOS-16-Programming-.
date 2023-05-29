//
//  ChartOverlay.swift
//  SwiftCharts
//
//  Created by Kamyar Elyasi on 29-May-23.
//

import SwiftUI
import Charts

struct HeartRateData: Identifiable {
    var id: UUID = .init()
    var time: String
    var value: Int
}

struct HeartRateChart: View {
    @State private var selectedHeartRate: HeartRateData? = nil
    
    let heartRates = [
        HeartRateData(time: "Morning", value: 72),
        HeartRateData(time: "Afternoon", value: 81),
        HeartRateData(time: "Evening", value: 95),
        HeartRateData(time: "Night", value: 61),
    ]
    
    var body: some View {
        ZStack {
            if let selectedHeartRate = selectedHeartRate {
                Text("Your Heart Rate in the \(selectedHeartRate.time) was \(selectedHeartRate.value)")
                    .offset(y: -200)
                    
            }
Chart(heartRates) { heartRate in
    RectangleMark(x: .value("Time", heartRate.time),
            y: .value("Value", heartRate.value))
    .foregroundStyle(.red)
        }
.frame(height: 250)
.chartOverlay { chart in
    GeometryReader { geometry in
        Rectangle()
            .fill(Color.clear)
            .contentShape(Rectangle())
            .gesture(
                DragGesture()
                    .onChanged { value in
                        let currentX = value.location.x - geometry[chart.plotAreaFrame].origin.x
                        guard currentX >= 0, currentX < chart.plotAreaSize.width else {
                            return
                                }
                                
                        guard let time = chart.value(atX: currentX, as: String.self) else {
                            return
                                }
                        selectedHeartRate = heartRates.first(where: {$0.time == time })
                            }
                    .onEnded { _ in
                        selectedHeartRate = nil
                    }
                )
            }
        }
        }
    }
}

struct HeartRateChart_Previews: PreviewProvider {
    static var previews: some View {
        HeartRateChart()
    }
}
