//
//  UserProvider.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

class UserProvider {
    
    public static var shared: UserProvider {
        return singleton
    }
    private static let singleton: UserProvider = UserProvider()
    
    func makeUserRepository() -> UserRepositroy {
        return DefaultUserRepository(dataTransferService: AppDataTransferService().userAuthenticationDataTransferService)
    }
}
