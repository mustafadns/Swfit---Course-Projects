//
//  Instructor.swift
//  RetainCycleExplanation
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

class Instructor {
    let name : String
    var course : Course?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Instructor \(name) deinitialized")
    }
}

class Course {
    let name : String
    let url : URL
    var instructor : Instructor?
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
    }
    
    deinit {
        print("Course \(name) deinitialized")
    }
}
