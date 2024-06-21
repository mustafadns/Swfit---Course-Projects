//
//  Dog.swift
//  SwiftUINavigation
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

import Foundation

struct Dog: Identifiable, Hashable {
    var id = UUID()
    let name : String
}

let dogs : [Dog] = [Dog(name: "Barley"), Dog(name: "Lucky"), Dog(name: "Daisy"), Dog(name: "Jack")]
