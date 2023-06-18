//
//  ContentView.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var timer = TimerCounter()
    @EnvironmentObject private var user: UserSettings
    
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            Text("Hi, \(storageManager.fetchLoginData())!")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(timer: timer)
            Spacer()
    
            Button(action: doLogout) {
                Text("Logout")
                    .borderStyle()
            }
            .frame(width: 200, height: 60)
            .background(.blue)
            .cornerRadius(20)
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black, lineWidth: 4)
            
            }
            .padding(.bottom)
        }
       
    }
    
    private func doLogout() {
        user.isLoggedIn.toggle()
        user.name = ""
        storageManager.deleteLogin(data: user.name)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}

struct ButtonView: View {
   @ObservedObject var timer: TimerCounter
    var body: some View {
        Button(action: timer.startTimer) {
            Text(timer.buttonTitle)
                .borderStyle()
        }
        .frame(width: 200, height: 60)
        .background(.red)
        .cornerRadius(20)
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        }
        .disabled(timer.disableButton)
    }
}

struct DefaultTextStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .foregroundColor(.white)
            .font(.title)
    }
}

extension Text {
    func borderStyle() -> some View {
        modifier(DefaultTextStyle())
    }
}

