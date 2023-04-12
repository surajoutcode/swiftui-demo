//
//  NotificationRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

public protocol NotificationRepository {
    
    @discardableResult
    func fetchNotification(userId: String, completion: @escaping ( (Result<[NotificationInfo], Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func sendNotification(data: NotificationInfo, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
}

