//
//  PostImageRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import Foundation

struct PostImageRequestDTO: Encodable {
    private let image: Data?
    
    enum CodingKeys: String, CodingKey {
        case image = "upload"
    }
    
    init(image: Data? = nil) {
        self.image = image
    }
    
    func getDictionary() -> [String: Any] {
        return [
            "upload" : image as Any

        ]
    }
}
