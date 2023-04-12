//
//  UserInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

public struct UserInfo: Equatable, Identifiable {
    public let id: String
    public var name: String
    public let username: String
    public let email: String
    public var bio: String?
    public var followers: [String]
    public var followings: [String]
    public var avatarExists: Bool?
    public var website: String?
    public var location: String?
    public var isCurrentUser: Bool?
    public var isFollowed: Bool?

    init(id: String, name: String, username: String, email: String, bio: String?, followers: [String], followings: [String], avatarExists: Bool?, website: String?, location: String?, isCurrentUser: Bool? = false, isFollowed: Bool? = false) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.bio = bio
        self.followers = followers
        self.followings = followings
        self.avatarExists = avatarExists
        self.website = website
        self.location = location
        self.isCurrentUser = isCurrentUser
        self.isFollowed = isFollowed
    }
}
