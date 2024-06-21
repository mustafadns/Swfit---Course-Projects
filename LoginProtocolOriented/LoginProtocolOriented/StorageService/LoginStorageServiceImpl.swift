//
//  LoginStorageServiceImpl.swift
//  LoginProtocolOriented
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

// Impl = Implemantation demek
class LoginStorageServiceImpl : LoginStorageService {
    private let storage = UserDefaults.standard
    
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    func setUserAccessToken(token: String) {
        storage.setValue(token, forKey: userAccessTokenKey)
    }
    
    func getUserAccessToken() -> String? {
        return storage.string(forKey: userAccessTokenKey)
    }
    
    
}
