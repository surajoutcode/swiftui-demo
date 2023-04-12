//
//  TweetCellViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 08/03/2023.
//

import SwiftUI

class TweetCellViewModel: ObservableObject {
    @Published var tweet: FeedInfo
    @Published var user: UserInfo?
    let currentUser: UserInfo
    let userRepository: UserRepositroy
    let tweetRepository: TweetRepository
    let notificationRepository: NotificationRepository
    
    init(tweet: FeedInfo, currentUser: UserInfo, userRepository: UserRepositroy, tweetRepository: TweetRepository, notificationRepository: NotificationRepository) {
        self.tweet = tweet
        self.currentUser = currentUser
        self.userRepository = userRepository
        self.tweetRepository = tweetRepository
        self.notificationRepository = notificationRepository
        self.fetchUser(userId: self.tweet.userId)
        self.checkTweetLiked()
    }
    
    func fetchUser(userId: String){
        self.userRepository.fetchUser(userId: userId) { result in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.user = response
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func like() {
        let data = LikeInfo(id: self.currentUser.id)
        self.tweetRepository.like(data: data, userId: self.tweet.id) { result in
            switch result {
            case .success(let response):
                self.sendNotification(postText: self.tweet.tweet, notificationType: .like) {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        }
        self.tweet.isLiked = true
    }
    
    func unlike() {
        let data = LikeInfo(id: self.currentUser.id)
        self.tweetRepository.unlike(data: data, userId: self.tweet.id) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        self.tweet.isLiked = false
    }
    
    func checkTweetLiked() {
        if (self.tweet.likes.contains(self.currentUser.id)) {
            self.tweet.isLiked = true
        }else {
            self.tweet.isLiked = false
        }
    }
    
    func sendNotification(postText: String, notificationType: NotificationType, completion: (() -> ())? = nil) {
        let data = NotificationInfo(username: currentUser.username, notSenderId: currentUser.id, notReceiverId: user?.id ?? "", postText: postText, notificationType: notificationType)
        self.notificationRepository.sendNotification(data: data) { result in
            switch result {
            case .success(_):
                completion?()
            case .failure(let error):
                print(error)
            }
        }
    }
}
