//
//  ContentView.swift
//  01_basic
//
//  Created by 전율 on 2023/12/19.
//

import SwiftUI

let place:String = "Franch"

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text(place)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
