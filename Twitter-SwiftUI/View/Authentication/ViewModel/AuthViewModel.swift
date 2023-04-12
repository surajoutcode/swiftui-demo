//
//  AuthViewmodel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import SwiftUI

class AuthViewModel: ObservableObject {
    
    let authRepository: AuthenticationRepository
    
    @Published var isAuthenticated: Bool = false
    @Published var currentUser: UserInfo?
    
    @Published var isRegisterComplete: Bool = false
    
    init(authRepository: AuthenticationRepository) {
        self.authRepository = authRepository
        if(self.authRepository.accessToken != nil) {
            isAuthenticated = false
        }
    }
           
    func login(email: String, password: String) {
        let data = LoginInfo(email: email, password: password)
        self.authRepository.login(loginInfo: data) { result in
            switch result {
            case .success(let response):
                self.isAuthenticated = true
                self.currentUser = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func register(data: RegisterInfo) {
        self.authRepository.register(registerInfo: data) { result in
            switch result {
            case .success(let response):
                self.isRegisterComplete = true
                print(response)
            case .failure(let error):
                self.isRegisterComplete = false
                print(error)
            }
        }
    }
    
    func logout() {
        self.authRepository.removeAll() { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    self.isAuthenticated = false
                    self.currentUser = nil
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
