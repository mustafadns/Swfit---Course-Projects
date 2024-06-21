//
//  WeakSelfExamples.swift
//  RetainCycleExplanation
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

struct LaunchedCourse {
    let title : String
    var isLaunched : Bool = false
    
    init(title: String) {
        self.title = title
    }
}

class WeakSelfInstructor {
    let name : String
    var course : WeakSelfCourse?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("Instructor \(name) deinitialized")
    }
}

class WeakSelfCourse {
    let name : String
    let url : URL
    weak var instructor : WeakSelfInstructor?
    
    var launchedCourses : [LaunchedCourse] = []
    var onLaunched : ((_ launchedCourse : LaunchedCourse) -> Void)?
    
    func launch(launchedCourse : LaunchedCourse) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.onLaunched?(launchedCourse)
        }
    }
    
    init(name: String, url: URL) {
        self.name = name
        self.url = url
        
        onLaunched = { [weak self] launchedCourse in
            self?.launchedCourses.append(launchedCourse)
            print("Launched course count: \(self?.launchedCourses.count)")
        }
    }
    
    deinit {
        print("Course \(name) deinitialized")
    }
}

