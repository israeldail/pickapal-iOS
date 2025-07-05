//
//  ContentView.swift
//  Pick-a-pal
//
//  Created by Israel Dail on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = ["Israel", "Elisha", "Aria", "Liam", "Noah", "Mia", "Owen", "Sophia", "Elijah", "William"]
    
    var body: some View {
        VStack {
            List {
                ForEach(names, id: \.description) { name in
                        Text(name)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
