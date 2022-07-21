//
//  ContentView.swift
//  LengthConverter
//
//  Created by Raul Pele on 21.07.2022.
//

import SwiftUI

enum Metrics {
    case meters
    case kilometers
    case feet
    case yard
    case miles
}

struct ContentView: View {
    
    var body: some View {
       Text("hello world")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
