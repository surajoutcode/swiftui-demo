//
//  EditProfileRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

struct EditProfileRequestDTO: Encodable {
    private let name: String?
    private let bio: String?
    private let location: String?
    private let website: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case bio = "bio"
        case location = "location"
        case website = "website"
    }
    
    init(name: String?, bio: String?, location: String?, website: String?) {
        self.name = name
        self.bio = bio
        self.location = location
        self.website = website
    }
}
