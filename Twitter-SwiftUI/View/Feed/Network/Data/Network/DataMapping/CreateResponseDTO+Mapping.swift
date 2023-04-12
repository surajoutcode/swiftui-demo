//
//  CreateResponseDTO+mapping.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import Foundation

extension CreatePostResponseDTO {
    func toDomain() -> TweetResponse {
        return TweetResponse(message: self.message, id: self.id ?? "")
    }
}
