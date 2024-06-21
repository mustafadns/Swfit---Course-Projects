//
//  ContentView.swift
//  NewStateManagementUI
//
//  Created by Mustafa DANIŞAN on 15.06.2024.
//

import SwiftUI
import SwiftData

@Observable
class DarkTheme {
    var isEnabled : Bool = false
}

// ChildView
// Toggle butonunun
struct DarkChooseView : View {
    
    @Bindable var darkTheme : DarkTheme
    var body: some View {
        Toggle(isOn: $darkTheme.isEnabled, label: {
            EmptyView()
        }).fixedSize()
    }
}

struct DarkChooseToggleView : View {
    @Environment (DarkTheme.self) private var darkTheme
    var body: some View {
        DarkChooseView(darkTheme: darkTheme)
    }
}

// ChildView
// Alttaki yazının
struct InformaitonText : View {
    
    @Environment (DarkTheme.self) private var darkTheme
    
    var body: some View {
        Text(darkTheme.isEnabled ? "Dark Theme Enabled" : "Dark Theme Not Enabled")
            .font(.title2)
            .foregroundStyle(darkTheme.isEnabled ? .white : .black)
    }
}

// ParentView
// Ana View
struct ContentView: View {

    @Environment (DarkTheme.self) private var darkTheme
    
    var body: some View {
        VStack  {
            DarkChooseToggleView()
            InformaitonText()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(darkTheme.isEnabled ? .black : .white )
    }
}


#Preview {
    ContentView()
        .environment(DarkTheme())
}
