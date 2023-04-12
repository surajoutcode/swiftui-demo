//
//  UploadProfileImageRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

struct UploadProfileImageRequestDTO: Encodable {
    private let image: Data?
    
    enum CodingKeys: String, CodingKey {
        case image = "avatar"
    }
    
    init(image: Data? = nil) {
        self.image = image
    }
    
    func getDictionary() -> [String: Any] {
        return [
            "avatar" : image as Any

        ]
    }
}
