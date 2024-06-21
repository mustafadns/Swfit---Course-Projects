//
//  UserViewModelOutput.swift
//  ProtocolOrientedUIKit
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

// UserViewModel 'in dönütü
protocol UserViewModelOutput : AnyObject {
    
    func updateView (name: String, userName: String, email: String)
    
}
