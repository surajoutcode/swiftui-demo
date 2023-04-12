//
//  CreatePostRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

struct CreatePostRequestDTO: Encodable {
    private let tweet: String
    private let user: String
    private let username: String
    private let userId: String
    
    enum CodingKeys: String, CodingKey {
        case tweet = "text"
        case user = "user"
        case username = "username"
        case userId = "userId"
    }
    
    init(tweet: String, user: String, username: String, userId: String) {
        self.tweet = tweet
        self.user = user
        self.username = username
        self.userId = userId
    }
}
