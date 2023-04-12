//
//  AuthenticationEndPoints.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

struct AuthenticationEndpoint {
    
    static func authenticateUser(requestDTO: LoginRequestDTO) -> Endpoint<LoginResponseDTO> {
      
        return Endpoint(path: "users/login",
                        method: .post,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func createUser(requestDTO: RegisterRequestDTO) -> Endpoint<RegisterResponseDTO> {
      
        return Endpoint(path: "users",
                        method: .post,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
}

