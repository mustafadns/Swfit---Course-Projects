//
//  FourthSwiftUIView.swift
//  FirstSwiftUIApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//


// Aksiyon olaylarını buton üzerinden göstermek için
import SwiftUI

struct FourthSwiftUIView: View {
    
    @State var myName = "Mustafa"
    
    var body: some View {
        VStack{
            Text(myName)
                .font(.largeTitle)
                .padding()
            
            Button {
                self.myName = "DANIŞAN"
            } label: {
                Text("MyButton")
            }

        }
    }
}

#Preview {
    FourthSwiftUIView()
}
