//
//  SecondSwiftUIView.swift
//  FirstSwiftUIApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//

import SwiftUI

// Width ve Height değerlerini ekrana göre vermek daha kullanışlı bir kod olacaktır çünkü farklı ekranlarda boyutu otomatik olarak ayarlanır ...
struct SecondSwiftUIView: View {
    var body: some View {
        Image("mercedes")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: UIScreen.main.bounds.width * 0.98, height: UIScreen.main.bounds.height * 0.3)
    }
}

#Preview {
    SecondSwiftUIView()
}
