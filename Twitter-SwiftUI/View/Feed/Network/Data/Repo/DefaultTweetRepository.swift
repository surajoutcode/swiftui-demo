//
//  DefaultTweetRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 03/03/2023.
//

import Foundation

public final class DefaultTweetRepository {
    
    private let dataTransferService: DataTransferService
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultTweetRepository: TweetRepository {
    
    public func postTweet(data: TweetInfo, completion: @escaping ((Result<TweetResponse, Error>) -> Void)) -> Resumable? {
        let endpoint = TweetEndPoint.postTweet(requestDTO: data.toRequestDTO())
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if(responseDTO.status == true) {
                    if data.image != nil {
                        self.postImage(data: data, id: responseDTO.id ?? "") { result in
                            switch result {
                            case .success(_):
                                completion(.success(responseDTO.toDomain()))
                            case .failure(let error):
                                completion(.failure(error))
                            }
                        }
                    }else {
                        completion(.success(responseDTO.toDomain()))
                    }
                }else {
                    completion(.failure(DomainError.error(responseDTO.message)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func postImage(data: TweetInfo, id: String, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = TweetEndPoint.postImage(requestDTO: data.toPostImageDTO(), userID: id)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.message))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func fetchTweets(userId: String?, completion: @escaping ((Result<[FeedInfo], Error>) -> Void)) -> Resumable? {
        let endpoint = TweetEndPoint.fetchTweet(userId: userId)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if(responseDTO.status == true) {
                    completion(.success(responseDTO.toDomain()))
                }else {
                    completion(.failure(DomainError.error("Something went wrong")))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func like(data: LikeInfo, userId: String, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = TweetEndPoint.like(requestDTO: data.toRequestDTO(), userId: userId)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.message))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func unlike(data: LikeInfo, userId: String, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = TweetEndPoint.unlike(requestDTO: data.toRequestDTO(), userId: userId)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.message))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
}


