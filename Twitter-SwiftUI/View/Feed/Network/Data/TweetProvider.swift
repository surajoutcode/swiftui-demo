//
//  TweetProvider.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

class TweetProvider {
    
    public static var shared: TweetProvider {
        return singleton
    }
    private static let singleton: TweetProvider = TweetProvider()
    
    func makeTweetRepository() -> TweetRepository {
        let dataStore = LoginDataStore()
        return DefaultTweetRepository(dataTransferService: AppDataTransferService().userAuthenticationDataTransferService)
    }
}
