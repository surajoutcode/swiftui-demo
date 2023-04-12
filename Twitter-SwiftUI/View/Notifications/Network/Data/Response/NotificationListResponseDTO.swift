//
//  NotificationListResponseDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 16/03/2023.
//

import Foundation

struct NotificationListResponseDTO: Decodable {
    let status: Bool
    let data: [NotificationData]
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case data = "data"
    }
}

struct NotificationData: Decodable {
    let id: String
    let username: String
    let notSenderId: String
    let notReceiverId: String
    let notificationType: NotificationType
    let postText: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case username = "username"
        case notSenderId = "notSenderId"
        case notReceiverId = "notReceiverId"
        case notificationType = "notificationType"
        case postText = "postText"
    }
}



