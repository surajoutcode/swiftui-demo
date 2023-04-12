//
//  NotificationCell.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 23/01/2023.
//

import SwiftUI
import Kingfisher

struct NotificationCell: View {
    @State var width = UIScreen.main.bounds.width
    
    let notification: NotificationInfo
    
    var body: some View {
        VStack {
            HStack(alignment: .top, content: {
                Image(systemName: "person.fill")
                    .resizable()
                    .foregroundColor(.blue)
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                
                VStack(alignment: .leading, content: {
                    KFImage(URL(string: "http://localhost:3000/users/\(notification.notSenderId)/avatar"))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 65, height: 65)
                        .clipShape(Circle())
                    
                    Text(notification.username)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    
                    +
                    
                    Text(" ")
                    
                    +
                    
                    Text(notification.notificationType.notificationMessage)
                        .foregroundColor(.black)
                    
                })
                Spacer()
            }).padding(.all, 12)
            
            Rectangle()
                .frame(width: width, height: 1, alignment: .center)
                .foregroundColor(.gray)
                .opacity(0.3)
        }
    }
}
