//
//  StorageManager.swift
//  StateAnaDataFlow
//
//  Created by Just Vovo on 17.06.2023.
//

import Foundation


final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    private let userDefaults = UserDefaults.standard
    private let key = "login"
  
    func save(loginData: String) {
        var login = fetchLoginData()
        login = loginData
        userDefaults.set(login, forKey: key)
    }
    
    func fetchLoginData() -> String {
        if let login = userDefaults.string(forKey: key) {
            return login
        }
        return ""
    }
    
    func deleteLogin(data: String) {
        var login = fetchLoginData()
        login = data
        userDefaults.set(login, forKey: key)
    }
        
    
}
