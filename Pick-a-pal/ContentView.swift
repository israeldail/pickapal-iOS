//
//  ContentView.swift
//  Pick-a-pal
//
//  Created by Israel Dail on 7/5/25.
//

import SwiftUI

struct ContentView: View {
    @State private var names: [String] = []
    @State private var nameToAdd: String = ""
    @State private var pickedName: String = ""
    @State private var shouldRemovePickedName: Bool = false
    
    var body: some View {
        VStack {
            Text(pickedName.isEmpty ? " " : pickedName)
            
            List {
                ForEach(names, id: \.description) { name in
                        Text(name)
                }
            }
            // $nameToAdd binds variable to this UI element
            TextField("Add name", text: $nameToAdd)
                .autocorrectionDisabled()
                .onSubmit {
                    if !nameToAdd.isEmpty {
                        names.append(nameToAdd)
                        nameToAdd = ""
                    }
                }
            Divider()
            // toggle for optional delete of name
            Toggle("Remove when picked" , isOn: $shouldRemovePickedName)
            
            // button for picking a random name
            Button("Pick a random name") {
                if let randomName = names.randomElement() {
                    pickedName = randomName
                    // removes name if toggle is on
                    if shouldRemovePickedName {
                        names.removeAll { name in
                            return (name == randomName)
                        }
                    }
                } else {
                    pickedName = ""
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
