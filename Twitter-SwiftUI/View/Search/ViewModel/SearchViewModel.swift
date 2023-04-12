//
//  SearchViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 12/03/2023.
//

import SwiftUI

class SearchViewModel: ObservableObject {
    
    @Published var users = [UserInfo]()
    
    let userRepository: UserRepositroy
    
    init(userRepository: UserRepositroy) {
        self.userRepository = userRepository
        fetchUsers()
    }
    
    func fetchUsers() {
        self.userRepository.fetchAllUser() { result in
            switch result {
            case .success(let response):
                self.users = response
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func filteredUsers(_ query: String) -> [UserInfo] {
        let lowercasedQuery = query.lowercased()
        return users.filter({ $0.name.lowercased().contains(lowercasedQuery) || $0.username.lowercased().contains(lowercasedQuery) })
    }
    
}

