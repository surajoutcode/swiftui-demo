//
//  LoginRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

public protocol AuthenticationRepository {
    var accessToken: String? { get }
    
    func storeAccessToken(token: String)
    
    func removeAll(completion: @escaping ( (Result<String, Error>) -> Void))
    
    @discardableResult
    func register(registerInfo: RegisterInfo, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func login(loginInfo: LoginInfo, completion: @escaping ( (Result<UserInfo, Error>) -> Void)) -> Resumable?
    
}
