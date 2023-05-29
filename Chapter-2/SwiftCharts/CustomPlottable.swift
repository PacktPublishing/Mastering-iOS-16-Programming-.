//
//  CustomPlottable.swift
//  SwiftCharts
//
//  Created by Kamyar Elyasi on 21-May-23.
//

import Foundation
import Charts

struct CustomPlottable: Plottable {
    // Plottable protocol has primitivePlottable property with PrimitivePlottable associatedType.
    // Note that your PrimitivePlottable should conform to PrimitivePlottableProtocol.
    var primitivePlottable: String
    init?(primitivePlottable: String) {
        self.primitivePlottable = primitivePlottable
    }
}

enum Gender: String, Plottable {
    case male = "Male"
    case female = "Female"
    case nonBinary = "Non-Binary"
}
