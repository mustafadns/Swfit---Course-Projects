//
//  SecondView.swift
//  SwiftUINavigation
//
//  Created by Mustafa DANIŞAN on 14.06.2024.
//


// Bu kısımda da NavigationStack sayesinde navigasyon işlemlerine daha hızlı ve basit bir şekilde müdahale etmeyi görüyoruz ...
import SwiftUI

struct SecondView: View {
    
    @State var path : [Dog] = []
    
    var body: some View {
        NavigationStack (path:$path){
            List (dogs) { dog in
                NavigationLink(dog.name, value: dog)
            }.navigationDestination(for: Dog.self) { dog in
                VStack {
                    Text(dog.name)
                    Button ("Go Back") {
                        self.path = []
                        // popToRootViewController
                    }
                }
            }
        }
    }
}

#Preview {
    SecondView()
}
