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
            
            VStack(spacing: 8) {
                            Image(systemName: "person.3.sequence.fill")
                    .foregroundStyle(.tint)
                    .symbolRenderingMode(.hierarchical)
                            Text("Pick-a-Pal")
                        }
                        .font(.title)
                        .bold()

            
            Text(pickedName.isEmpty ? " " : pickedName)
                .font(.title2)
                .bold()
                .foregroundStyle(.tint)
            
            List {
                ForEach(names, id: \.description) { name in
                        Text(name)
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 8))
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
            Button {
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
            } label: {
                Text("Pick a random name")
                .padding(.vertical, 8)
                .padding(.horizontal, 16)
            }
            .buttonStyle(.borderedProminent)
            .font(.title2)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
