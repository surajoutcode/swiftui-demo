//
//  UserListResponseDTO+Mapping.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 12/03/2023.
//

import Foundation

extension UserListResponseDTO {
    func toDomain() -> [UserInfo] {
        return data.map{ $0.toDomain() }
    }
}
