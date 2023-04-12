//
//  NotificationEndPoint.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

struct NotificationEndPoint {
    
    static func fetchNotification(userId: String) -> Endpoint<NotificationListResponseDTO> {
      
        return Endpoint(path: "notification/\(userId)",
                        method: .get
        )
    }
    
    
    static func sendNotification(requestDTO: NotificationRequestDTO) -> Endpoint<NotificationResponseDTO> {
      
        return Endpoint(path: "notification",
                        method: .post,
                        bodyParamatersEncodable: requestDTO,
                        bodyEncoding: JSONEncoding.default
        )
    }
}
