//
//  UserAccessInfo.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

public struct UserAccessInfo: Equatable {
    public let accessToken: String

    public init(accessToken: String) {
        self.accessToken = accessToken
    }
}
