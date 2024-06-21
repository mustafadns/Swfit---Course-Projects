//
//  ContentView.swift
//  FavoriteBookApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach (myFavorites) { favorite in
                    Section(header: Text(favorite.title)) {
                        ForEach (favorite.elements) { element in
                            NavigationLink(destination: DetailsSwiftUIView(choosenFavotiteElement: element)) {
                                Text(element.name)
                            }
                        }
                    }
                }
            }.navigationBarTitle(Text("Favorite Book"))
        }
    }
}

#Preview {
    ContentView()
}
