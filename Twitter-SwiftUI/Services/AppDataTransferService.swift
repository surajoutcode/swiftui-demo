//
//  AppDataTransferService.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

final class AppDataTransferService {
    
    lazy var appConfiguration = AppConfiguration()
    
    lazy var defaultDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: appConfiguration.apiBaseURL)
        let networkService = DefaultNetworkService(config: config)
        let dataTransferService = DefaultDataTransferService(with: networkService)
        return dataTransferService
    }()
    
    lazy var userAuthenticationDataTransferService: DataTransferService = {
        let config = ApiDataNetworkConfig(baseURL: appConfiguration.apiBaseURL)
        let networkService = DefaultNetworkService(config: config, sessionManager: UserAuthenticationSessionManager(loginRepository: AuthProvider.shared.makeLoginRepository()))
        let dataTransferService = DefaultDataTransferService(with: networkService)
        return dataTransferService
    }()
}
