//
//  CatalogScreen.swift
//  TestUI
//
//  Created by Кирилл Тила on 29.11.2021.
//

import SwiftUI

final class FoodListViewModel: ObservableObject {
    
    @Published var isFavEnabled = true
    
    @Published private(set) var foods = [
        Food(name: "Orange", isFav: false),
        Food(name: "Chese", isFav: true),
        Food(name: "Apple", isFav: true),
        Food(name: "Marik", isFav: false)
    ]
    
}

struct Food: Identifiable {
    
    var id: String { name }
    let name: String
    let isFav: Bool
    
}

struct CatalogScreen: View {
    
    @ObservedObject var foodListViewModel = FoodListViewModel()
    @EnvironmentObject var dashboardViewModel: DashboardViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                FoodList()
                    .environmentObject(foodListViewModel)
                    .navigationTitle("Food")
                    .navigationBarHidden(true)
                NavigationLink(tag: dashboardViewModel.selectionIndex ?? 0, selection: $dashboardViewModel.selectionIndex) {
                    DetailFood(name: foodListViewModel.foods[dashboardViewModel.selectionIndex ?? 0].name)
                } label: {}
            }
        }
    }
    
    struct FoodList: View {
        
        @EnvironmentObject var foodListViewModel: FoodListViewModel
        @EnvironmentObject var dashboardViewModel: DashboardViewModel

        var body: some View {
            List {
                CatalogFilterCell()
                ForEach(foodListViewModel.foods) { food in
                    if !foodListViewModel.isFavEnabled || food.isFav {
                        NavigationLink(destination: DetailFood(name: food.name)) {
                            Label(food.name, systemImage: "leaf")
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct DetailFood: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .font(.largeTitle)
    }
    
}

struct CatalogFilterCell: View {
    
    @EnvironmentObject var foodListViewModel: FoodListViewModel
    
    var body: some View {
        Toggle(isOn: $foodListViewModel.isFavEnabled) {
            Text("Show Favorites")
        }
    }

}

struct CatalogScreen_Previews: PreviewProvider {
    static var previews: some View {
        CatalogScreen()
    }
}
