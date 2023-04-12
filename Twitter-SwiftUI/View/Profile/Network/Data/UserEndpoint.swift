//
//  UserEndpoint.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

struct UserEndPoint {
    
    static func fetchAllUser() -> Endpoint<UserListResponseDTO> {
      
        return Endpoint(path: "users/",
                        method: .get
        )
    }
    
    static func fetchUser(userId: String) -> Endpoint<UserResponseDTO> {
      
        return Endpoint(path: "users/\(userId)",
                        method: .get
        )
    }
    
    static func updateUserProfile(requestDTO: EditProfileRequestDTO, userId: String) -> Endpoint<EditProfileResponseDTO> {
      
        return Endpoint(path: "users/\(userId)",
                        method: .patch,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func uploadProfileImage(requestDTO: UploadProfileImageRequestDTO) -> Endpoint<EditProfileResponseDTO> {
      
        return Endpoint(path: "users/me/avatar",
                        method: .post,
                        bodyParamaters: requestDTO.getDictionary(),
                        bodyEncoding: MultiPartEncoding.default
        )
    }
    
    static func follow(requestDTO: FollowRequestDTO, userId: String) -> Endpoint<EditProfileResponseDTO> {
      
        return Endpoint(path: "users/\(userId)/follow",
                        method: .put,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
    
    static func unfollow(requestDTO: FollowRequestDTO, userId: String) -> Endpoint<EditProfileResponseDTO> {
      
        return Endpoint(path: "users/\(userId)/unfollow",
                        method: .put,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
}
