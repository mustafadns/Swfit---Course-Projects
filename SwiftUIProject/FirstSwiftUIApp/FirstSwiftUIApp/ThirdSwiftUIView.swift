//
//  ThirdSwiftUIView.swift
//  FirstSwiftUIApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//


// Listeleme işlemlerinin nasıl yapıldığını göstermek için
import SwiftUI

struct ThirdSwiftUIView: View {
    
    let myArray = ["Mercedes","BMW","Volvo","Ferrari"]
    
    var body: some View {
        List (myArray, id: \.self) { element in
            Text(element)
        }
    }
}

#Preview {
    ThirdSwiftUIView()
}
