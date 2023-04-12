//
//  LikeRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 12/03/2023.
//

import Foundation

struct LikeRequestDTO: Encodable {
    private let id: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
    }
    
    init(id: String) {
        self.id = id
    }
}
