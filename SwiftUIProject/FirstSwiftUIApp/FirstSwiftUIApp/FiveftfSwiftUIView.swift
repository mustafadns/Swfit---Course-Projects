//
//  FiveftfSwiftUIView.swift
//  FirstSwiftUIApp
//
//  Created by Mustafa DANIŞAN on 7.06.2024.
//


// Anlık olarak veri aktarımını göstermek için
import SwiftUI

struct FiveftfSwiftUIView: View {
    
    @State var myName = "Mustafa"
    
    var body: some View {
        VStack {
            Text(myName)
                .padding()
                .font(.largeTitle)
            TextField("placeholder" , text: $myName)
        }
    }
}

#Preview {
    FiveftfSwiftUIView()
}
