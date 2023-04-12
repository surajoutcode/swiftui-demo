//
//  NotificationListResponseDTO+mapping.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 16/03/2023.
//

import Foundation

extension NotificationListResponseDTO {
    func toDomain() -> [NotificationInfo] {
        return data.map{ $0.toDomain() }
    }
}

extension NotificationData {
    func toDomain() -> NotificationInfo {
        return NotificationInfo(id: self.id, username: self.username, notSenderId: self.notSenderId, notReceiverId: self.notReceiverId, postText: self.postText, notificationType: self.notificationType)
    }
}
