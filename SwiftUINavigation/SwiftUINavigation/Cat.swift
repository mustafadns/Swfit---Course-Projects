//
//  Cat.swift
//  SwiftUINavigation
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

import Foundation

struct Cat: Identifiable, Hashable {
    var id = UUID()
    let name : String
}

let cats : [Cat] = [Cat(name: "A"), Cat(name: "B"), Cat(name: "C"), Cat(name: "D")]
