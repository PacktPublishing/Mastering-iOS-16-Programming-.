//
//  IntroducingMarks.swift
//  SwiftCharts
//
//  Created by Kamyar Elyasi on 26-Apr-23.
//

import SwiftUI
import Charts

struct IntroducingMarks: View {
    var body: some View {
        // Run the playground and swipe between tabs to see different mark types
        TabView {
            Group {
                
                // MARK: - BarMark
                Chart {
                    BarMark(
                        x: .value("Dogs count", "Dogs"),
                        y: .value("Total", 10)
                    )
                    BarMark(
                        x: .value("Cats count", "Cats"),
                        y: .value("Total", 7)
                    )
                }
                
                // MARK: - LineMark
                Chart {
                    LineMark(
                        x: .value("Dogs count", "Dogs"),
                        y: .value("Total", 10)
                    )
                    LineMark(
                        x: .value("Cats count", "Cats"),
                        y: .value("Total", 7)
                    )
                }
                
                // MARK: - PointMark
                Chart {
                    PointMark(
                        x: .value("Dogs count", "Dogs"),
                        y: .value("Total", 10)
                    )
                    PointMark(
                        x: .value("Cats count", "Cats"),
                        y: .value("Total", 7)
                    )
                }
                
                // MARK: - AreaMark
                Chart {
                    AreaMark(
                        x: .value("Dogs count", "Dogs"),
                        y: .value("Total", 10)
                    )
                    AreaMark(
                        x: .value("Cats count", "Cats"),
                        y: .value("Total", 7)
                    )
                }
                
                // MARK: - RectangleMark
                Chart {
                    RectangleMark(
                        x: .value("Dogs count", "Dogs"),
                        y: .value("Total", 10)
                    )
                    RectangleMark(
                        x: .value("Cats count", "Cats"),
                        y: .value("Total", 7)
                    )
                }
                
                // MARK: - RuleMark
                Chart {
                    RuleMark(xStart: .value("From year", "2018"),
                             xEnd: .value("To year", "2020"),
                             y: .value("Pet", "Dog"))
                    
                    RuleMark(xStart: .value("From year", "2021"),
                             xEnd: .value("To year", "2023"),
                             y: .value("Pet", "Cat"))
                }
                
            }
            .frame(height: 250)
            .padding()
        }
        .tabViewStyle(.page)
        .frame(height: 400)
    }
}

struct IntroducingMarks_Previews: PreviewProvider {
    static var previews: some View {
        IntroducingMarks()
    }
}
