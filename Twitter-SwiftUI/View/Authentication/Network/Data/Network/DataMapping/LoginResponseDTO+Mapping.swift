//
//  LoginResponseDTO+Mapping.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

extension LoginData {
    func toDomain() -> UserInfo {
        return UserInfo(id: id, name: name, username: username, email: email, bio: bio, followers: followers, followings: followings, avatarExists: avatarExists, website: website, location: location)
    }
}
