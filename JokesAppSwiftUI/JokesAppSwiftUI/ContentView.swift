//
//  ContentView.swift
//  JokesAppSwiftUI
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var jokesVM = JokesViewModel()
    
    var body: some View {
        NavigationView {
            List(jokesVM.jokes) { element in
                Text(element.joke)
            }.navigationTitle("Jokes App")
        }
    }
}

#Preview {
    ContentView()
}
