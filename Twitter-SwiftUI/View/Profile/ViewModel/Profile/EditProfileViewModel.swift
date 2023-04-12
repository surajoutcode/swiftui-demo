//
//  EditProfileViewModel.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 09/03/2023.
//

import SwiftUI

class EditProfileViewModel: ObservableObject {
    
    let userRepository: UserRepositroy
    
    var user: UserInfo
    
    @Published var uploadComplete = false
    
    init(user: UserInfo, userRepository: UserRepositroy) {
        self.user = user
        self.userRepository = userRepository
    }
    
    func save(data: EditProfileInfo) {
        guard let name = data.name else {return}
        guard let bio = data.bio else {return}
        guard let location = data.location else {return}
        guard let website = data.website else {return}
        self.user.name = name
        self.user.bio = bio
        self.user.location = location
        self.user.website = website
        
        self.userRepository.updateUserData(data: data, userId: user.id) { result in
            switch result {
            case .success(let response):
                self.uploadComplete.toggle()
            case .failure(let error):
                print(error)
            }
        }
    }
}
