//
//  EditProfileInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

public struct EditProfileInfo: Equatable {
    public let name: String?
    public let bio: String?
    public let location: String?
    public let website: String?
    public let avatar: Data?

    public init(name: String? = nil,
                bio: String? = nil, location: String? = nil, website: String? = nil, avatar: Data? = nil) {
        self.name = name
        self.bio = bio
        self.location = location
        self.website = website
        self.avatar = avatar
    }
}

extension EditProfileInfo {
    func toRequestDTO() -> EditProfileRequestDTO {
        EditProfileRequestDTO(name: self.name, bio: self.bio, location: self.location, website: self.website)
    }
    
    func toUploadProfileDTO() -> UploadProfileImageRequestDTO {
        UploadProfileImageRequestDTO(image: self.avatar)
    }
}
