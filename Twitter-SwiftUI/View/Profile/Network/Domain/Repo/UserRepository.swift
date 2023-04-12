//
//  UserRepository.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import Foundation

public protocol UserRepositroy {
    
    @discardableResult
    func fetchAllUser(completion: @escaping ( (Result<[UserInfo], Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func fetchUser(userId: String, completion: @escaping ( (Result<UserInfo, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func updateUserData(data: EditProfileInfo, userId: String, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func uploadProfileImage(data: EditProfileInfo, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func follow(data: FollowInfo, userId: String, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
    
    @discardableResult
    func unFollow(data: FollowInfo, userId: String, completion: @escaping ( (Result<String, Error>) -> Void)) -> Resumable?
}
