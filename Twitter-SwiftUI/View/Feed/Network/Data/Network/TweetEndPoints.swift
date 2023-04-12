//
//  TweetEndPoints.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

struct TweetEndPoint {
    
    static func postTweet(requestDTO: CreatePostRequestDTO) -> Endpoint<CreatePostResponseDTO> {
      
        return Endpoint(path: "posts",
                        method: .post,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func postImage(requestDTO: PostImageRequestDTO, userID: String) -> Endpoint<CreatePostResponseDTO> {
      
        return Endpoint(path: "uploadTweetImage/\(userID)",
                        method: .post,
                        bodyParamaters: requestDTO.getDictionary(),
                        bodyEncoding: MultiPartEncoding.default
        )
    }
    
    static func fetchTweet(userId: String?) -> Endpoint<FeedResponseDTO> {
      
        return Endpoint(path: "posts/\(userId ?? "")",
                        method: .get,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func like(requestDTO: LikeRequestDTO, userId: String) -> Endpoint<CreatePostResponseDTO> {
      
        return Endpoint(path: "tweets/\(userId)/like",
                        method: .put,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func unlike(requestDTO: LikeRequestDTO, userId: String) -> Endpoint<CreatePostResponseDTO> {
      
        return Endpoint(path: "tweets/\(userId)/unlike",
                        method: .put,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
}
