//
//  CryptoCurrency.swift
//  CryptoCrazySwiftUI
//
//  Created by Mustafa DANIŞAN on 13.06.2024.
//

import Foundation

// JSON Data'sından gelen currency ve price bilgilerini alıp yanına da id değerini eklemek için tasaranmış bir struct
struct CryptoCurrency: Hashable, Decodable, Identifiable {
    let id = UUID()
    let currency : String
    let price : String
    
    // gelecek olan değerlerin isimleri değişik değişik isimlerse bu kısımda değerler isimleriyle alınıp kullanılmak istenilen değere çevirilebilir ...
    private enum CodingKeys : String, CodingKey {
        case currency = "currency"
        case price = "price"
    }

}
