//
//  DefaultAuthenticationRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

public final class DefaultAuthenticationRepository {
    
    private let dataTransferService: DataTransferService
    private let loginDataStore: LoginDataStore
    
    public init(dataTransferService: DataTransferService, loginDataStore: LoginDataStore) {
        self.dataTransferService = dataTransferService
        self.loginDataStore = loginDataStore
    }
}

extension DefaultAuthenticationRepository: AuthenticationRepository {
    
    public var accessToken: String? {
        return loginDataStore.getAccessToken()
    }
    
    public func storeAccessToken(token: String) {
        self.loginDataStore.saveAccessToken(token: "Bearer \(token)") { _ in
            return
        }
    }
    
    public func removeAll(completion: @escaping ((Result<String, Error>) -> Void)) {
        self.loginDataStore.removeAccessToken { result in
            switch result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public func register(registerInfo: RegisterInfo, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = AuthenticationEndpoint.createUser(requestDTO: registerInfo.toRequestDTO())
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if(responseDTO.status) {
                    completion(.success(responseDTO.message))
                }else {
                    completion(.failure(DomainError.error(responseDTO.message)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func login(loginInfo: LoginInfo, completion: @escaping ((Result<UserInfo, Error>) -> Void)) -> Resumable? {
        let endpoint = AuthenticationEndpoint.authenticateUser(requestDTO: loginInfo.toRequestDTO())
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                self.loginDataStore.saveAccessToken(token: "Bearer \(responseDTO.token)") { _ in
                    completion(.success(responseDTO.data.toDomain()))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
}

