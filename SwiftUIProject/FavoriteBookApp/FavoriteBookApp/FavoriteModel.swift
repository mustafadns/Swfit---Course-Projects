//
//  FavoriteModel.swift
//  FavoriteBookApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//

import Foundation
import SwiftUI

struct FavoriteModel : Identifiable {
    var id = UUID()
    var title : String
    var elements : [FavoriteElement]
}

struct FavoriteElement : Identifiable {
    var id = UUID()
    var name : String
    var imagename : String
    var description : String
}


// Cars
let Mercedes = FavoriteElement(name: "Mercedes", imagename: "Mercedes", description: "I love mercedes")
let BMW = FavoriteElement(name: "BMW", imagename: "BMW", description: "I love BMW")
let Ferrari = FavoriteElement(name: "Ferrari", imagename: "Ferrari", description: "I love ferrari")

let favoriteCars = FavoriteModel(title: "Favorite Cars", elements: [Mercedes,BMW,Ferrari])


// Movies
let pulpFiction = FavoriteElement(name: "Pulp Fiction", imagename: "pulpFiction", description: "I love Pulp Fiction")
let theDarkNight = FavoriteElement(name: "The Dark Night", imagename: "theDarkNight", description: "I love The Dark Night")
let killBill = FavoriteElement(name: "Kill Bill", imagename: "killBill", description: "I love Kill Bill")

let favoriteMovies = FavoriteModel(title: "Favorite Movies", elements: [pulpFiction,theDarkNight,killBill])

let myFavorites = [favoriteCars,favoriteMovies]
