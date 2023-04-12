//
//  NotificationProvider.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

class NotificationProvider {
    
    public static var shared: NotificationProvider {
        return singleton
    }
    private static let singleton: NotificationProvider = NotificationProvider()
    
    func makeNotificationRepository() -> NotificationRepository {
        return DefaultNotificationRepository(dataTransferService: AppDataTransferService().userAuthenticationDataTransferService)
    }
}
