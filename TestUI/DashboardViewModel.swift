//
//  DashboardViewModel.swift
//  TestUI
//
//  Created by Кирилл Тила on 29.11.2021.
//

import SwiftUI

final class DashboardViewModel: ObservableObject {
    
    @Published var title: String = "Dashboard"
    @Published var isContactShowed = false
    
}
