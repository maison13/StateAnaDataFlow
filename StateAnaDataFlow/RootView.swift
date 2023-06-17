//
//  RootView.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var user = UserSettings()
    
    var body: some View {
        Group {
            if user.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }
        .environmentObject(user)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
