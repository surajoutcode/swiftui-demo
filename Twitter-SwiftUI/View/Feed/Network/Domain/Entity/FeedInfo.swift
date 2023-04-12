//
//  FeedInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import Foundation

public struct FeedInfo: Equatable, Identifiable {
    public let id: String
    public let userId: String
    public let name: String
    public let username: String
    public let tweet: String
    public let likes: [String]
    public let image: String?
    public let createdDate: String
    public let updatedDate: String
    public var isLiked: Bool?
    

    init(id: String, userId: String, name: String, username: String, tweet: String, likes: [String], image: String?, createdDate: String, updatedDate: String, isLiked: Bool? = false) {
        self.id = id
        self.userId = userId
        self.name = name
        self.username = username
        self.tweet = tweet
        self.likes = likes
        self.image = image
        self.createdDate = createdDate
        self.updatedDate = updatedDate
        self.isLiked = isLiked
    }
}



