//
//  TweetInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

public struct TweetInfo: Equatable {
    public let tweet: String
    public let userId: String
    public let user: String
    public let username: String
    public let image: Data?

    init(tweet: String, userId: String, user: String, username: String, image: Data? = nil) {
        self.tweet = tweet
        self.userId = userId
        self.user = user
        self.username = username
        self.image = image
    }
}

extension TweetInfo {
    func toRequestDTO() -> CreatePostRequestDTO {
        CreatePostRequestDTO(tweet: self.tweet, user: self.user, username: self.username, userId: self.userId)
    }
    
    func toPostImageDTO() -> PostImageRequestDTO {
        PostImageRequestDTO(image: self.image)
    }
}
