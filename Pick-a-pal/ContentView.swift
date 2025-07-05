//
//  ContentView.swift
//  Pick-a-pal
//
//  Created by Israel Dail on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            List {
                Text("Israel D.")
                Text("Andre")
                Text("Jasmine")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
