//
//  NotificationRequestDTO.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 13/03/2023.
//

import Foundation

struct NotificationRequestDTO: Encodable {
    private let username: String
    private let notSenderId: String
    private let notReceiverId: String
    private let notificationType: String
    private let postText: String
    
    enum CodingKeys: String, CodingKey {
        case username = "username"
        case notSenderId = "notSenderId"
        case notReceiverId = "notReceiverId"
        case notificationType = "notificationType"
        case postText = "postText"
    }
    
    init(username: String, notSenderId: String, notReceiverId: String, notificationType: String, postText: String) {
        self.username = username
        self.notSenderId = notSenderId
        self.notReceiverId = notReceiverId
        self.notificationType = notificationType
        self.postText = postText
    }
}
