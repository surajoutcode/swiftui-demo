//
//  NotificationResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 13/03/2023.
//

import Foundation

struct NotificationResponseDTO: Decodable {
    let status: Bool
    let message: String
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case message = "message"
        }
}
