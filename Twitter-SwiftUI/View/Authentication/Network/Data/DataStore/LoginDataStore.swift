//
//  LoginDataStore.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

public class LoginDataStore {
    
    private let keychainAccess: KeychainAccess
    
    init() {
        keychainAccess = KeychainAccess(service: Bundle.main.bundleIdentifier ?? "")
    }
    
    func saveAccessToken(token: String, completion: @escaping ((Result<String, Error>) -> Void)) {
        let pAccessToken = UserDefaults.standard.string(forKey: UserDefaultKeys.ACCESS_TOKEN.rawValue)
        do {
            if let previousAccessToken = pAccessToken {
                try keychainAccess.remove(key: previousAccessToken)
            }
            try keychainAccess.save(token, forKey: token)
            UserDefaults.standard.set(token, forKey: UserDefaultKeys.ACCESS_TOKEN.rawValue)
            completion(.success("Data Saved to keychain"))
        } catch {
            completion(.failure(error.toDomainError()))
        }
    }

    func getAccessToken() -> String? {
        let accessToken = UserDefaults.standard.string(forKey: UserDefaultKeys.ACCESS_TOKEN.rawValue)
               do {
                   guard let accessToken = accessToken else {
                       return nil
                   }
                   let key = try keychainAccess.retrieve(key: accessToken)
                   return key
               } catch {
                   return nil
               }
    }
    
    func removeAccessToken(completion: @escaping ((Result<String, Error>) -> Void)) {
        do {
            try keychainAccess.removeAll()
            completion(.success("Data removed from keychain"))
        }catch {
            completion(.failure(error.toDomainError()))
        }
    }
}

