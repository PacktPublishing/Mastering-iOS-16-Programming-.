//
//  EmployeesChart+Annotations.swift
//  SwiftCharts
//
//  Created by Kamyar Elyasi on 24-May-23.
//

import SwiftUI
import Charts

struct EmployeesChartWithAnnotations: View {
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
        Chart(employees) { employee in
            BarMark(x: .value("Name", employee.name),
                    y: .value("Age", employee.age))
            .foregroundStyle(by: .value("Gender", employee.gender))
            .symbol(by: .value("Gender", employee.gender))
            .symbol(.cross)
            .clipShape(Capsule())
            .offset(y: -2.5)
            .annotation(position: .bottom,
                        alignment: .center,
                        spacing: 12) {
                Text(employee.age.description)
                    .font(.caption)
            }
        }
        .frame(height: 300)
        .padding()
    }
}

struct EmployeesChartWithAnnotations_Previews: PreviewProvider {
    static var previews: some View {
        EmployeesChartWithAnnotations()
    }
}
