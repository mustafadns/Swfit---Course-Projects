//
//  ContentView.swift
//  PhotoPickerSwiftUI
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//

import SwiftUI
import PhotosUI

// SwiftUI ile image seçme olayını b şekilde yapıyoruz ve normal yaptığımızdan daha kolay ...

struct ContentView: View {
    
    // Seçilen fotoğrafı tanımlıyoruz
    @State var selectedItem : [PhotosPickerItem] = []
    
    // Seçilen fotoğrafı data'ya çeviriyoruz
    @State var data : Data?
    
    var body: some View {
        // Seçilen fotoğrafı ekrana bastırıyoruz
        VStack {
            if let data = data {
                if let selectedItem = UIImage(data: data) {
                    Spacer()
                    Image(uiImage: selectedItem)
                        .resizable()
                        .frame(width: 300, height: 250, alignment: .center)
                }
            }
            Spacer()
            
            // Fotoğraf seçme olayını bu kısımda ayarlıyoruz
            // onChange : Seçilen fotoğraf değiştirilirse ekranda da değpiştirmek için tanımlanan bir metod
            PhotosPicker(
                selection: $selectedItem,
                maxSelectionCount: 1,
                matching: .images) {
                    Text("Select Image")
                }.onChange(of: selectedItem) { oldValue, newValue in
                    guard let item = selectedItem.first else {
                        return
                    }
                    item.loadTransferable(type: Data.self) { result in
                        switch result {
                            case .success(let data):
                                if let data = data {
                                    self.data = data
                                }
                            case .failure(let error):
                                print(error)
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
