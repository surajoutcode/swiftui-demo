//
//  FollowRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 14/03/2023.
//

import Foundation

struct FollowRequestDTO: Encodable {
    private let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
    init(id: String) {
        self.id = id
    }
}
