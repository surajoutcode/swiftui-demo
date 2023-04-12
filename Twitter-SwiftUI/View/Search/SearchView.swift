//
//  SearchView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var isEditing = false
    
    @EnvironmentObject var authModel: AuthViewModel
    
    @ObservedObject var viewModel = SearchViewModel(userRepository: UserProvider.shared.makeUserRepository())
    
    var users: [UserInfo] {
        return searchText.isEmpty ? viewModel.users : viewModel.filteredUsers(searchText)
    }
    
    var body: some View {
        VStack {
            ScrollView(content: {
            SearchBar(text: $searchText, isEditing: $isEditing)
                .padding(.top, 8)
                .padding(.horizontal)
                LazyVStack {
                    ForEach(users) { user in
                        NavigationLink(destination: UserProfile(user: user, authModel: authModel)) {
                            SearchListCellView(user: user)
                                .padding(12)
                        }
                    }
                }
            })
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
