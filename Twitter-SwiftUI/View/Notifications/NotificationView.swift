//
//  NotificationView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct NotificationView: View {
    
    let user: UserInfo
    @ObservedObject var viewModel: NotificationViewModel
    
    init(user: UserInfo) {
        self.user = user
        viewModel = NotificationViewModel(user: user, notificationRepository: NotificationProvider.shared.makeNotificationRepository())
    }
    var body: some View {
        VStack {
            ScrollView(content: {
                ForEach(viewModel.notification) { notification in
                    NotificationCell(notification: notification)
                }
            })
        }
    }
}
