//
//  ProfileScreen.swift
//  TestUI
//
//  Created by Кирилл Тила on 29.11.2021.
//

import SwiftUI

struct ModalScreen: View {
    
    var body: some View {
        Text("Modal Screen")
            .font(.largeTitle)
    }
    
}

struct ProfileScreen: View {
    
    @State private var isModalScreenPresented = false
    
    var body: some View {
        Button { isModalScreenPresented.toggle() } label: {
            Text("Open Modal Screen")
        }.sheet(isPresented: $isModalScreenPresented) {
            ModalScreen()
        }

    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
