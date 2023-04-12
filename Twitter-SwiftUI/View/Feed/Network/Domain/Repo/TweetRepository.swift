//
//  TweetRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

public protocol TweetRepository {
    
    @discardableResult
    func postTweet(data: TweetInfo, completion: @escaping ( (Result<TweetResponse, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func postImage(data: TweetInfo, id: String, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func fetchTweets(userId: String?, completion: @escaping ( (Result<[FeedInfo], Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func like(data: LikeInfo, userId: String, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func unlike(data: LikeInfo, userId: String, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
}
