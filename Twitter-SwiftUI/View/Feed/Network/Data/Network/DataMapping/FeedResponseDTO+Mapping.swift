//
//  FeedResponseDTO+Mapping.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import Foundation

extension FeedResponseDTO {
    func toDomain() -> [FeedInfo] {
        return feedData?.map{ $0.toDomain() } ?? []
    }
}

extension FeedData {
    func toDomain() -> FeedInfo {
        FeedInfo(id: self.id, userId: self.userId, name: self.name, username: self.username, tweet: self.tweet, likes: self.likes, image: self.image, createdDate: self.createdDate, updatedDate: self.updatedDate)
    }
}
