//
//  NotificationInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

public struct NotificationInfo: Equatable, Identifiable {
    public let id: String?
    public let username: String
    public let notSenderId: String
    public let notReceiverId: String
    public let postText: String
    public let notificationType: NotificationType
    
    init(id: String? = nil, username: String, notSenderId: String, notReceiverId: String, postText: String, notificationType: NotificationType) {
        self.id = id
        self.username = username
        self.notSenderId = notSenderId
        self.notReceiverId = notReceiverId
        self.postText = postText
        self.notificationType = notificationType
    }
}

public enum NotificationType: String, Decodable {
    case like = "like"
    case follow = "follow"
    
    var notificationMessage: String {
        switch self {
            case .like: return "liked your tweet"
            case .follow: return "followed you"
        }
    }
}

extension NotificationInfo {
    func toRequestDTO() -> NotificationRequestDTO {
        NotificationRequestDTO(username: self.username, notSenderId: self.notSenderId, notReceiverId: self.notReceiverId, notificationType: self.notificationType.rawValue, postText: self.postText)
    }
}
