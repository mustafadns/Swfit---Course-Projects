//
//  UserService.swift
//  ProtocolOrientedUIKit
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

// UserService protokolünü oluşturmak için
protocol UserService {
    func fetchUser(completion: @escaping(Result<User, Error>) -> Void)
}
