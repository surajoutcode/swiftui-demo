//
//  FollowInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 12/03/2023.
//


import Foundation

public struct FollowInfo: Equatable {
    public let id: String

    public init(id: String) {
        self.id = id
    }
}

extension FollowInfo {
    func toRequestDTO() -> FollowRequestDTO {
        FollowRequestDTO(id: self.id)
    }
}
