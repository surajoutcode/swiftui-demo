//
//  TweetResponse.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import Foundation

public struct TweetResponse: Equatable {
    public let message: String
    public let id: String

    public init(message: String, id: String) {
        self.message = message
        self.id = id
    }
}
