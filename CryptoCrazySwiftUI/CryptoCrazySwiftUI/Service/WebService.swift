//
//  WebService.swift
//  CryptoCrazySwiftUI
//
//  Created by Mustafa DANIŞAN on 13.06.2024.
//

import Foundation

// Data gelirken sıkıntı yaşanması ve sorunsuz gelmesi durumunun değerlendirilmesi
class WebService {
    
    // İOS 15+ ' a gelen özellik ... (async ... await metodu)
    func downloadCurrenciesAsync (url: URL) async throws -> [CryptoCurrency] {
        let (data, _ ) = try await URLSession.shared.data(from: url)
        
        let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
        
        return currencies ?? []
    }
    
    
    
    
      // Bu da elimizde olan async bir fonksiyon değilse nasıl async hale getiririz onun gösterimi,downloadCurrenciesAsync bu fonksiyonu kullanmak en mantıklısı ancak kütüphane ya da herhangi bir yerden gelen async olmayan fonksiyon gelirse çevirmek için kullanırız ...
//    func downloadCurrenciesContinuation (url: URL) async throws -> [CryptoCurrency] {
//        try await withCheckedThrowingContinuation { continuation in
//            downloadCurrencies(url: url) { result in
//                switch result {
//                case .success(let cryptos):
//                    continuation.resume(returning: cryptos ?? [])
//                case .failure(let error):
//                    continuation.resume(throwing: error)
//                }
//            }
//        }
//    }
    

    
    
      // Önceki eğitimlerde de kullandığımız yöntem ...
//    func downloadCurrencies(url : URL, completion : @escaping(Result<[CryptoCurrency]?,DownloaderError>) -> Void) {
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            
//            // Eğer url'den kaynaklı bir sıkıntı yaşanırsa bu bloğa girer
//            if let error = error {
//                print(error.localizedDescription)
//                completion(.failure(.badUrl))
//            }
//            
//            // Eğer data'nın gelmemesi durumu yaşanırsa bu bloğa girer
//            guard let data = data, error == nil else {
//                return completion(.failure(.noData))
//            }
//            
//            // Eğer bu iki hata haricinde sistemsel bir hata gelirse bu bloğa girer
//            guard let currencies = try? JSONDecoder().decode([CryptoCurrency].self, from: data) else {
//                return completion(.failure(.dataParseError))
//            }
//            
//            completion(.success(currencies))
//            
//        }.resume()
//    }
}



// Hata tanımlamaları
enum DownloaderError : Error {
    case noData
    case badUrl
    case dataParseError
}
