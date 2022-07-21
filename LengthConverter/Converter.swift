//
//  Converter.swift
//  LengthConverter
//
//  Created by Raul Pele on 21.07.2022.
//

import Foundation

class Converter {
    static func convertTo(target: Unit, from initial: Unit, value: Double) -> Double {
        let meters = unitToMeters[initial]! * value
        let result = meters / unitToMeters[target]!
        
        return result
    }
}
