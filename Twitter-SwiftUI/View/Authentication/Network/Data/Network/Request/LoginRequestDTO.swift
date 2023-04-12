//
//  LoginRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

struct LoginRequestDTO: Encodable {
    private let email: String
    private let password: String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
    }
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
