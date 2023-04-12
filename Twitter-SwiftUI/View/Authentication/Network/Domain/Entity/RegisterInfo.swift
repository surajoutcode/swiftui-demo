//
//  RegisterInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

public struct RegisterInfo: Equatable {
    public let name: String
    public let username: String
    public let email: String
    public let password: String
    public let bio: String?
    public let website: String?

    public init(name: String,
                email: String, username: String, password: String, bio: String? = nil, website: String? = nil) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
        self.bio = bio
        self.website = website
    }
}

extension RegisterInfo {
    func toRequestDTO() -> RegisterRequestDTO {
        RegisterRequestDTO(name: self.name, username: self.username, email: self.email, password: self.password, bio: self.bio, website: self.website)
    }
}
