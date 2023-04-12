//
//  RegisterRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

struct RegisterRequestDTO: Encodable {
    private let name: String
    private let username: String
    private let email: String
    private let password: String
    private let bio: String?
    private let website: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case username = "username"
        case email = "email"
        case password = "password"
        case bio = "bio"
        case website = "website"
    }
    
    init(name: String, username: String, email: String, password: String, bio: String?, website: String?) {
        self.name = name
        self.username = username
        self.email = email
        self.password = password
        self.bio = bio
        self.website = website
    }
}
