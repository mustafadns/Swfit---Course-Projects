//
//  UserViewModel.swift
//  ProtocolOrientedUIKit
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    weak var output : UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let user):
                self?.output?.updateView(name: user.name, userName: user.username, email: user.email)
            case .failure(_):
                self?.output?.updateView(name: "No user", userName: "", email: "")
            }
        }
    }
    
}
