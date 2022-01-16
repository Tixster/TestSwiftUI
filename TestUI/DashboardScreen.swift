//
//  DashboardScreen.swift
//  TestUI
//
//  Created by Кирилл Тила on 29.11.2021.
//

import SwiftUI

struct DashboardScreen: View {
    
    @Binding var selected: Int
    @EnvironmentObject var dashboardViewModel: DashboardViewModel

    var body: some View {
        NavigationView() {
            DashboardListView(selected: $selected)
        }
    }
    
}

struct DashboardListView: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @State private var isAboutActive = false
    @Binding var selected: Int

    var body: some View {
        List {
            DashboardHeadCell(isAboutActive: $isAboutActive, selected: $selected)
            NavigationLink(destination: AboutAppScreen(), isActive: $isAboutActive, label: {
                Text("About App")
            })
        }
        .navigationBarTitle(Text(dashboardViewModel.title))
    }
    
}

struct DashboardSwift_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen(selected: .constant(0))
    }
}

struct DashboardHeadCell: View {
    
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    @Binding var isAboutActive: Bool
    @Binding var selected: Int

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                selected = 1
                dashboardViewModel.selectionIndex = 2 },
                   label: {
                VStack {
                    Image(systemName: "text.book.closed")
                    Text("Contact")
                }
            })
            Spacer()
            
        }
    }
    
}
