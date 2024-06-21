//
//  ContentView.swift
//  AsyncImageSwiftUI
//
//  Created by Mustafa DANIŞAN on 12.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                AsyncImage(url: URL(string: "https://m.media-amazon.com/images/M/MV5BMTcyNDAwNDc2OF5BMl5BanBnXkFtZTcwOTc4MjIwNQ@@._V1_.jpg")!) { image in
                    image.resizable().frame(width: 300, height: 500, alignment: .center)
                } placeholder: {
                    ProgressView()
                }

                
                List(superHeroArray) { superhero in
                    Text(superhero.name)
                }
                .navigationTitle(Text("SüperHero Book"))
            }
        }
    }
}

#Preview {
    ContentView()
}
