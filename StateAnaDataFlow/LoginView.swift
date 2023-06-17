//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserSettings
    
    var body: some View {
        VStack {
            TextField("Enter your name...", text: $name )
                .multilineTextAlignment(.center)
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
        }
    }
    
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
