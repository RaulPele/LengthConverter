//
//  ContentView.swift
//  LengthConverter
//
//  Created by Raul Pele on 21.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var fromUnit: Unit = .kilometer
    @State private var toUnit: Unit = .meter
    @State private var fromValue = 0.0
    
    @FocusState private var fromValueIsFocused: Bool
    
    var result: Double {
        return Converter.convertTo(target: toUnit, from: fromUnit, value: fromValue)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $fromValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($fromValueIsFocused)

                    Picker("Convert from: ", selection: $fromUnit) {
                        ForEach(Unit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From:")
                }
                
                Section {
                    Picker("Convert to: ", selection: $toUnit) {
                        ForEach(Unit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(result.formatted())
                } header: {
                    Text("TO: ")
                }
                
            }
            .navigationTitle("Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        fromValueIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
