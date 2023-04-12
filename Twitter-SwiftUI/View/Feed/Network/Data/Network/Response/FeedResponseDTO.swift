//
//  FeedResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import Foundation

struct FeedResponseDTO: Decodable {
    let status: Bool
    let feedData: [FeedData]?
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case feedData = "data"
        }
}

struct FeedData: Decodable {
    let id: String
    let userId: String
    let name: String
    let username: String
    let tweet: String
    let likes: [String]
    let image: String?
    let createdDate: String
    let updatedDate: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case userId = "userId"
        case name = "user"
        case username = "username"
        case tweet = "text"
        case likes = "likes"
        case image = "image"
        case createdDate = "createdAt"
        case updatedDate = "updatedAt"
    }
}


