//
//  RegisterResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

struct RegisterResponseDTO: Decodable {
    let status: Bool
    let message: String
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case message = "message"
        }
}
