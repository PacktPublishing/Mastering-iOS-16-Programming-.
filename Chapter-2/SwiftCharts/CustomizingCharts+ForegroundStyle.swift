//
//  CustomizingCharts+ForegroundStyle.swift
//  SwiftCharts
//
//  Created by Kamyar Elyasi on 22-May-23.
//

import SwiftUI
import Charts

struct Employee: Identifiable {
    var id: UUID = .init()
    var name: String
    var age: Int
    var gender: Gender
}

struct EmployeesChart: View {
    let employees = [
        Employee(name: "Kamyar", age: 27, gender: .male),
        Employee(name: "Matineh", age: 29, gender: .female),
        Employee(name: "Zahra", age: 29, gender: .female),
        Employee(name: "Amir", age: 27, gender: .male),
        Employee(name: "Hosein", age: 27, gender: .nonBinary),
        Employee(name: "Kaveh", age: 36, gender: .male),
        Employee(name: "Sanaz", age: 36, gender: .female)
    ]
    
    var body: some View {
        Chart(employees) {
            BarMark(x: .value("Name", $0.name),
                    y: .value("Age", $0.age))
            .foregroundStyle(by: .value("Gender", $0.gender))
        }
        .frame(height: 300)
        .padding()
    }
}

struct EmployeesChart_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesChart()
    }
}
