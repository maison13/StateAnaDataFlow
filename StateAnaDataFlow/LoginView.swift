//
//  LoginView.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var characterColor: Color = .red
    @State private var isButtonDisable = true
    @EnvironmentObject private var user: UserSettings
    
    
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name...", text: $name )
                    .multilineTextAlignment(.center)
                    .frame(width: 200)
                    .padding(.leading, 50)
                    .padding(.trailing, 30)
               
                Text("\(name.count)")
                    .foregroundColor(characterColor)
            }
            .onChange(of: name) { _ in
                checkCharacterCount()
            }
        
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
            .disabled(isButtonDisable)
        }
    }
    
    private func login() {
        if !name.isEmpty {
            user.name = name
            user.isLoggedIn.toggle()
        }
    }

    private  func checkCharacterCount() {
        if (0...3).contains(name.count) {
            characterColor = .red
            isButtonDisable = true
        } else {
            characterColor = .green
            isButtonDisable = false
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
