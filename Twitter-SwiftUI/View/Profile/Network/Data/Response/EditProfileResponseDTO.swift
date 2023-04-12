//
//  EditProfileResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

struct EditProfileResponseDTO: Decodable {
    let status: Bool
    let message: String
    
    enum CodingKeys: String, CodingKey {
            case status = "status"
            case message = "message"
        }
}
