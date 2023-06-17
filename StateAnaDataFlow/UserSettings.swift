//
//  UserSettings.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import Foundation

final class UserSettings: ObservableObject {
    @Published var isLoggedIn = false
    var name = ""
}
