//
//  LoginStorageService.swift
//  LoginProtocolOriented
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

protocol LoginStorageService {
    
    var userAccessTokenKey : String {get}
    func setUserAccessToken(token : String)
    func getUserAccessToken() -> String?
    
}
