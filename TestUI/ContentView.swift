//
//  ContentView.swift
//  TestUI
//
//  Created by Кирилл Тила on 29.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    
    var body: some View {
        
        TabView(selection: $selection) {
            DashboardScreen()
                .tabItem {
                    VStack {
                        Text("Dashboard")
                        Image(systemName: "paperplane")
                        Text("Dashboard")
                    }
                }
                .tag(0)
            
            CatalogScreen()
                .tabItem {
                    Label("Catalog", systemImage: "folder")
                }
                .tag(1)
            
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(2)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
