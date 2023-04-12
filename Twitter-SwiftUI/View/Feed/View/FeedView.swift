//
//  FeedView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct FeedView: View {
    @EnvironmentObject var authModel: AuthViewModel
    @ObservedObject var viewModel = FeedViewModel(tweetRepository: TweetProvider.shared.makeTweetRepository())
    
    
    var body: some View {
        RefreshableScrollView {
            ScrollView(.vertical, showsIndicators: false, content: {
                LazyVStack(spacing: 8, content: {
                    ForEach(viewModel.tweets) { tweet in
                        TweetCellView(cellViewModel: TweetCellViewModel(tweet: tweet, currentUser: authModel.currentUser!, userRepository: UserProvider.shared.makeUserRepository(), tweetRepository: TweetProvider.shared.makeTweetRepository(), notificationRepository: NotificationProvider.shared.makeNotificationRepository()))
                        Divider()
                    }
                })
                .padding(.top)
                .padding(.horizontal)
                .zIndex(0)
            })
        } onRefresh: { control in
            DispatchQueue.main.async {
                self.viewModel.fetchTweets()
                control.endRefreshing()
            }
            
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
