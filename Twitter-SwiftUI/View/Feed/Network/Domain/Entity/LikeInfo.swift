//
//  LikeInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 12/03/2023.
//

import Foundation

public struct LikeInfo: Equatable {
    public let id: String

    public init(id: String) {
        self.id = id
    }
}

extension LikeInfo {
    func toRequestDTO() -> LikeRequestDTO {
        LikeRequestDTO(id: self.id)
    }
}
