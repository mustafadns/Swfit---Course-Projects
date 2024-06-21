//
//  CryptoViewModel.swift
//  CryptoCrazySwiftUI
//
//  Created by Mustafa DANIŞAN on 13.06.2024.
//


// Piyasadaki en çok kullanılan yöntem ve şekil olmasından dolayı mantığını iyi analam gerekiyo ...
import Foundation


//ObservableObject gelen verilerdeki anlık değişimi takip etmek için kullanıldı ayrıca ..
// @Published de şu demek gelen verileri anlık güncelledikten sonra tanımlanan veri dizisini de güncellemek yani burda canlı yayın yapılıyor MainView de de izleniliyor gibi düşünülebilir
// Inheritance kullanıldığı için class yapıldı yani kalıtım alınan bir sistemi var

// Fonksiyonarın main thread de çalışması için kullanılır ve ( DispatchQueue.main.async ) kullanımını ortadan kaldırmaya yarar ..
@MainActor

// Bu yöntem sektörde en çok kullanılan yöntem ve şekildir !!!
class CryptoListViewModel : ObservableObject {
    
    @Published var cryptoList = [CryptoViewModel]()
    
    let webservice = WebService()
    
    func downloadCryptosAsync (url: URL) async {
        do {
            let cryptos = try await webservice.downloadCurrenciesAsync(url: url)
            self.cryptoList = cryptos.map(CryptoViewModel.init)
            
              // @MainActor kullanılmadığı zaman kullanılması gerekiyor (bazı durumlarda @MainActor kullanılamayabilir o zamanlar ...)
//            DispatchQueue.main.async {
//                self.cryptoList = cryptos.map(CryptoViewModel.init)
//            }
        } catch {
            print(error)
        }
    }
    
    
      // WebServices sayfasındaki eski üzün yöntemin fonksiyonu
//    func downloadCryptos (url : URL) {
//        webservice.downloadCurrencies(url: url) { result in
//            switch result {
//            case .success(let cryptos):
//                if let cryptos = cryptos {
//                    DispatchQueue.main.async {
//                        self.cryptoList = cryptos.map(CryptoViewModel.init)
//                    }
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
    
}


// CryptoCurrency'den gelen verilerin işlenip belirli bir yapıya koyulması için
struct CryptoViewModel {
    let crypto : CryptoCurrency
    
    var id : UUID? {
        crypto.id
    }
    
    var currency : String {
        crypto.currency
    }
    
    var price : String {
        crypto.price
    }
}
