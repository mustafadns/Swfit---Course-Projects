//
//  ContentView.swift
//  CryptoCrazySwiftUI
//
//  Created by Mustafa DANIŞAN on 13.06.2024.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var cryptoListViewModal : CryptoListViewModel
    
    let selectUrl = "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json"
    
    init () {
        self.cryptoListViewModal = CryptoListViewModel()
    }
    
    var body: some View {
        
        NavigationView {
            List(cryptoListViewModal.cryptoList, id: \.id) { crypto in
                VStack {
                    Text(crypto.currency)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    Text(crypto.price)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity,alignment: .leading)
                }
            }.toolbar(content: {
                Button(action: {
                    
                    Task.init {
                        cryptoListViewModal.cryptoList = []
                        await cryptoListViewModal.downloadCryptosAsync(url: URL(string: selectUrl)!)
                    }
                    
                }, label: {
                    Text("Refresh")
                })
            })
            
            .navigationTitle(Text("Crypto Crazy"))
        }.task {
            await cryptoListViewModal.downloadCryptosAsync(url: URL(string: selectUrl)!)
        }
        
//      .onAppear {
            // WebServices sayfasındaki eski üzün yöntemin fonksiyonu
//          cryptoListViewModal.downloadCryptos(url: URL(string: selectUrl)!)
//      }
    }
}

#Preview {
    MainView()
}
