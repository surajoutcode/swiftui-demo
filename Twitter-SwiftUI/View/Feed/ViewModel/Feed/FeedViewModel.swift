//
//  FeedViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import SwiftUI

class FeedViewModel: ObservableObject {
    
    let tweetRepository: TweetRepository
    
    @Published var tweets = [FeedInfo]()
    
    init(tweetRepository: TweetRepository) {
        self.tweetRepository = tweetRepository
        fetchTweets()
    }
    
    func fetchTweets(){
        self.tweetRepository.fetchTweets(userId: "") { result in
            switch result {
            case .success(let response):
                self.tweets = response
            case .failure(let error):
                print(error)
            }
        }
    }
}
