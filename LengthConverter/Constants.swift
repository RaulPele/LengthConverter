//
//  Constants.swift
//  LengthConverter
//
//  Created by Raul Pele on 21.07.2022.
//

import Foundation

//all conversions will use "meter" as the base conversion metric
enum Unit: String, CaseIterable {
    case meter = "m"
    case kilometer = "km"
    case foot = "ft"
    case yard = "yrd"
    case mile = "mile"
}

let unitToMeters = [Unit.meter: 1.0,
                    Unit.kilometer: 1000.0,
                    Unit.foot: 0.3048,
                    Unit.yard: 0.9144,
                    Unit.mile: 1609.344]
