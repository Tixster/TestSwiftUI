//
//  DashboardScreen.swift
//  TestUI
//
//  Created by Кирилл Тила on 29.11.2021.
//

import SwiftUI

struct DashboardScreen: View {
    
    var body: some View {
        NavigationView() {
            DashboardListView()
        }
    }
    
}

struct DashboardListView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State private var isAboutActive = false
    
    var body: some View {
        List {
            DashboardHeadCell(isAboutActive: $isAboutActive)
            NavigationLink(destination: AboutAppScreen(), isActive: $isAboutActive, label: {
                Text("About App")
            })
        }
        .navigationBarTitle(Text(dashboardViewModel.title))
    }
    
}

struct DashboardSwift_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}

struct DashboardHeadCell: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @Binding var isAboutActive: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: { dashboardViewModel.isContactShowed.toggle() }, label: {
                VStack {
                    Image(systemName: "text.book.closed")
                    Text("Contact")
                }
            }).sheet(isPresented: $dashboardViewModel.isContactShowed, onDismiss: nil, content: {
                let foodName = CatalogScreen().foodListViewModel.foods[0].name
                CatalogScreen().sheet(isPresented: $dashboardViewModel.isContactShowed, onDismiss: nil) {
                    DetailFood(name: foodName)
                }
            })
            Spacer()
            
        }
    }
    
}
