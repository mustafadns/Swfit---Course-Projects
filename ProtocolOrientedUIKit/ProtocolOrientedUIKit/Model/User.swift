//
//  User.swift
//  ProtocolOrientedUIKit
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import Foundation

// API 'dan gelen kullanıcı bilgilerini belirli bir kalıba koyabilmek için

// MARK: - WelcomeElement
struct User: Codable {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}
