//
//  DefaultNotificationRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

public final class DefaultNotificationRepository {
    
    private let dataTransferService: DataTransferService
    
    public init(dataTransferService: DataTransferService) {
        self.dataTransferService = dataTransferService
    }
}

extension DefaultNotificationRepository: NotificationRepository {
    
    public func fetchNotification(userId: String, completion: @escaping ((Result<[NotificationInfo], Error>) -> Void)) -> Resumable? {
        let endpoint = NotificationEndPoint.fetchNotification(userId: userId)
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                print(responseDTO)
                completion(.success(responseDTO.toDomain()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
    
    public func sendNotification(data: NotificationInfo, completion: @escaping ((Result<String, Error>) -> Void)) -> Resumable? {
        let endpoint = NotificationEndPoint.sendNotification(requestDTO: data.toRequestDTO())
        let task = self.dataTransferService.request(with: endpoint) { result in
            switch result {
            case .success(let responseDTO):
                if(responseDTO.status) {
                    completion(.success(responseDTO.message))
                }else {
                    completion(.failure(DomainError.error(responseDTO.message)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
        return task?.toResumable()
    }
}

