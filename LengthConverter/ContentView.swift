//
//  ContentView.swift
//  LengthConverter
//
//  Created by Raul Pele on 21.07.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var initialUnit: Unit = .kilometer
    @State private var targetUnit: Unit = .meter
    @State private var initialValue = 0.0
    
    @FocusState private var initialValueIsFocused: Bool
    
    var result: Double {
        return Converter.convertTo(target: targetUnit, from: initialUnit, value: initialValue)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Value", value: $initialValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($initialValueIsFocused)

                    Picker("Convert from: ", selection: $initialUnit) {
                        ForEach(Unit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("From:")
                }
                
                Section {
                    Picker("Convert to: ", selection: $targetUnit) {
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
                        initialValueIsFocused = false
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
