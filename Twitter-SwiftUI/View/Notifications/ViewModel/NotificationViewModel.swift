//
//  NotificationViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 13/03/2023.
//

import SwiftUI

class NotificationViewModel: ObservableObject {
    let user: UserInfo
    let notificationRepository: NotificationRepository
    
    @Published var notification = [NotificationInfo]()
    
    init(user: UserInfo, notificationRepository: NotificationRepository) {
        self.user = user
        self.notificationRepository = notificationRepository
        fetchNotification()
    }
    
    func fetchNotification(){
        self.notificationRepository.fetchNotification(userId: user.id) { result in
            switch result {
            case .success(let response):
                self.notification = response
            case .failure(let error):
                print(error)
            }
        }
    }
}
