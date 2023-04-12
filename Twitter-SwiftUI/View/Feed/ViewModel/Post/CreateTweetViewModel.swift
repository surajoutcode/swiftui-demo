//
//  CreateTweetViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import SwiftUI

class CreateTweetViewModel: ObservableObject {
    
    let tweetRepository: TweetRepository
    @Published var uploadComplete = false
    
    init(tweetRepository: TweetRepository) {
        self.tweetRepository = tweetRepository

    }
    
    func uploadPost(data: TweetInfo){
        self.tweetRepository.postTweet(data: data) { result in
            switch result {
            case .success(let response):
                print(response)
                self.uploadComplete.toggle()
            case .failure(let error):
                print(error)
                self.uploadComplete.toggle()
            }
        }
    }
}
