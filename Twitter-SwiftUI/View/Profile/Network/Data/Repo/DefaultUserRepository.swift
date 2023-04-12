//
//  DefaultUserRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

public final class DefaultUserRepository {
    
    private let dataTransferService: DataTransferService
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultUserRepository: UserRepositroy {
    
    public func fetchAllUser(completion: @escaping ((Result<[UserInfo], Error>) -> Void)) -> Resumable? {
        let endpoint = UserEndPoint.fetchAllUser()
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func fetchUser(userId: String, completion: @escaping ((Result<UserInfo, Error>) -> Void)) -> Resumable? {
        let endpoint = UserEndPoint.fetchUser(userId: userId)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                completion(.success(responseDTO.data.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func updateUserData(data: EditProfileInfo, userId: String, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = UserEndPoint.updateUserProfile(requestDTO: data.toRequestDTO(), userId: userId)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                        if data.avatar != nil {
                            self.uploadProfileImage(data: data) { result in
                                switch result {
                                case .success(_):
                                    completion(.success(responseDTO.message))
                                case .failure(let error):
                                    completion(.failure(error))
                                }
                            }
                        }else {
                            completion(.success(responseDTO.message))
                        }
                    
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func uploadProfileImage(data: EditProfileInfo, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = UserEndPoint.uploadProfileImage(requestDTO: data.toUploadProfileDTO())
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
    
    public func follow(data: FollowInfo, userId: String, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = UserEndPoint.follow(requestDTO: data.toRequestDTO(), userId: userId)
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
    
    public func unFollow(data: FollowInfo, userId: String, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = UserEndPoint.unfollow(requestDTO: data.toRequestDTO(), userId: userId)
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
