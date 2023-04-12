//
//  LoginInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

public struct LoginInfo: Equatable {
    public let email: String
    public let password: String

    public init(email: String,
         password: String) {
        self.email = email
        self.password = password
    }
}

extension LoginInfo {
    func toRequestDTO() -> LoginRequestDTO {
        LoginRequestDTO(email: self.email, password: self.password)
    }
}
