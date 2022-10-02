//
//  ContentView.swift
//  NavigationSplitViewInSwiftUI
//
//  Created by Ramill Ibragimov on 02.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var someData = NewData.exampleData
    @State private var selection: NewData?
    
    var body: some View {
        
        NavigationSplitView {
            List(someData, selection: $selection) { data in
                Text(data.name).tag(data)
            }
        } detail: {
            Text(selection?.name ?? "Choose a data")
        }
    }
}

struct NewData: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let details: String
}

extension NewData {
    static var exampleData: [NewData] {
    [
        .init(name: "One", details: "First"),
        .init(name: "Two", details: "Second"),
        .init(name: "Three", details: "Third"),
        ]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
