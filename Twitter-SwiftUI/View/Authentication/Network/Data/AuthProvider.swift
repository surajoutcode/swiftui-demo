//
//  LoginProvider.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

class AuthProvider {
    
    public static var shared: AuthProvider {
        return singleton
    }
    private static let singleton: AuthProvider = AuthProvider()
    private var authRepository: AuthenticationRepository?
    
    func makeLoginRepository() -> AuthenticationRepository {
        let dataStore = LoginDataStore()
        if authRepository == nil {
            authRepository = DefaultAuthenticationRepository(dataTransferService: AppDataTransferService().defaultDataTransferService, loginDataStore: dataStore)
            return authRepository!
        }else {
            return authRepository!
        }
    }
}
