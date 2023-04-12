//
//  UserAuthenticationSessionManager.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

public class UserAuthenticationSessionManager: NetworkSessionManager {
    
    private let loginRepository: AuthenticationRepository
    
    public init(loginRepository: AuthenticationRepository) {
        self.loginRepository = loginRepository
    }
    
    @discardableResult
    public func request(_ request: URLRequest, completion: @escaping CompletionHandler) -> NetworkCallable {
        
        var newRequest = request
        if let accessToken = self.loginRepository.accessToken {
            newRequest.addValue(accessToken, forHTTPHeaderField: "Authorization")
        }
        let task = URLSession.shared.dataTask(with: newRequest) { (data, response, error) in
//            if let response = response as? HTTPURLResponse, response.statusCode == 401 {
//              // handle refresh token here
//            } else {
                completion(data, response, error)
//            }
        }
        task.resume()
        return task
    }
}

