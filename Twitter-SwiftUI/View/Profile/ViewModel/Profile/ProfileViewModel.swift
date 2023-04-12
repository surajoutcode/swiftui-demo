//
//  ProfileViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import SwiftUI

class ProfileViewModel: ObservableObject {
    
    
    @Published var user: UserInfo
    
    let currentUser: UserInfo
    
    let tweetRepository: TweetRepository
    let userRepository: UserRepositroy
    let notificationRepository: NotificationRepository
    
    @Published var tweets = [FeedInfo]()
    
    init(user: UserInfo, currentUser: UserInfo, userRepository: UserRepositroy, tweetRepository: TweetRepository, notificationRepository: NotificationRepository) {
        self.tweetRepository = tweetRepository
        self.userRepository = userRepository
        self.notificationRepository = notificationRepository
        self.user = user
        self.currentUser = currentUser
        fetchTweets()
        isCurrentUser()
        checkUserFollow()
    }
    
    func isCurrentUser() {
        if (self.user.id == currentUser.id) {
            self.user.isCurrentUser = true
        }else {
            self.user.isCurrentUser = false
        }
    }
    
    func fetchUser(userId: String){
        self.userRepository.fetchUser(userId: userId) { result in
            switch result {
            case .success(let response):
                self.user = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchTweets(){
        self.tweetRepository.fetchTweets(userId: self.user.id) { result in
            switch result {
            case .success(let response):
                self.tweets = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func follow() {
        let data = FollowInfo(id: self.user.id)
        self.userRepository.follow(data: data, userId: self.user.id) { result in
            switch result {
            case .success(let response):
                self.sendNotification(postText: "", notificationType: .follow) {
                    print(response)
                }
            case .failure(let error):
                print(error)
            }
        }
        self.user.isFollowed = true
    }
    
    func unFollow() {
        let data = FollowInfo(id: self.user.id)
        self.userRepository.unFollow(data: data, userId: self.user.id) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        self.user.isFollowed = false
    }
    
    func checkUserFollow() {
        if (self.user.followers.contains(self.currentUser.id)) {
            self.user.isFollowed = true
        }else {
            self.user.isFollowed = false
        }
    }
    
    func sendNotification(postText: String, notificationType: NotificationType, completion: (() -> ())? = nil) {
        let data = NotificationInfo(username: currentUser.username, notSenderId: currentUser.id, notReceiverId: user.id, postText: postText, notificationType: notificationType)
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
