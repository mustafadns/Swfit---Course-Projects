//
//  ViewController.swift
//  RetainCycleExplanation
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // deinit çalışmadı
//        var course : Course? = Course(name: "IOS Course", url: URL(string: "www.atilsamancioglu.com")!)
//        var instructor : Instructor? = Instructor(name: "Atil Samancioglu")
//        
//        // strong referance, retain cycle
//        course?.instructor = instructor
//        instructor?.course = course
//        
//        course = nil
//        instructor = nil
        
        
// ---------------------------------------------------------------------------------------------------------------------
        
        
        // deinit çalıştı
//        var course : WeakCourse? = WeakCourse(name: "IOS Course", url: URL(string: "www.atilsamancioglu.com")!)
//        var instructor : WeakInstructor? = WeakInstructor(name: "Atil Samancioglu")
//        
//        // weak referance
//        course?.instructor = instructor
//        instructor?.course = course
//        
//        course = nil
//        instructor = nil
//    }
    
    
// -----------------------------------------------------------------------------------------------------------------------

        var course : WeakSelfCourse? = WeakSelfCourse(name: "IOS Course", url: URL(string: "www.atilsamancioglu.com")!)
        var instructor : WeakSelfInstructor? = WeakSelfInstructor(name: "Atil Samancioglu")
        
        // weak referance
        course?.instructor = instructor
        instructor?.course = course
        
        course!.launch(launchedCourse: LaunchedCourse(title: "IOS"))
        
        course = nil
        instructor = nil
    }

}

