//
//  DetailsSwiftUIView.swift
//  FavoriteBookApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//

import SwiftUI

struct DetailsSwiftUIView: View {
    
    var choosenFavotiteElement : FavoriteElement
    
    var body: some View {
        VStack {
            Image(choosenFavotiteElement.imagename)
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(choosenFavotiteElement.name)
                .font(.largeTitle)
                .padding()
            Text(choosenFavotiteElement.description)
                .font(.headline)
        }
    }
}

#Preview {
    DetailsSwiftUIView(choosenFavotiteElement: theDarkNight)
}
