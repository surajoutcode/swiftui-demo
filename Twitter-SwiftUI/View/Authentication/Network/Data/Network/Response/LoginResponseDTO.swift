//
//  LoginResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let status: Bool
    let token: String
    let data: LoginData
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case token = "token"
        case data = "data"
    }
}

struct LoginData: Decodable {
    let id: String
    let name: String
    let username: String
    let email: String
    let followers: [String]
    let followings: [String]
    let avatarExists: Bool?
    let bio: String?
    var location: String?
    var website: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name = "name"
        case username = "username"
        case email = "email"
        case followers = "followers"
        case followings = "followings"
        case avatarExists = "avatarExists"
        case bio = "bio"
        case location = "location"
        case website = "website"
    }
}

extension LoginResponseDTO {
    func toDomain() -> UserAccessInfo {
        return .init(accessToken: token)
    }
}

