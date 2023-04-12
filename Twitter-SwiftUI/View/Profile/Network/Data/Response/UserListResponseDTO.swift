//
//  UserListResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 12/03/2023.
//

import Foundation

struct UserListResponseDTO: Decodable {
    let status: Bool
    let data: [UserData]
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}
