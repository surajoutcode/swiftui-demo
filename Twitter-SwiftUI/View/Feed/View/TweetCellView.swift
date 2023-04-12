//
//  TweetCellView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI
import Kingfisher

struct TweetCellView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @ObservedObject var cellViewModel: TweetCellViewModel
    
    var isLiked: Bool {
        return cellViewModel.tweet.isLiked ?? false
    }
    
    init(cellViewModel: TweetCellViewModel) {
        self.cellViewModel = cellViewModel
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16, content: {
                if let user = cellViewModel.user {
                    NavigationLink(destination: UserProfile(user: user, authModel: viewModel)) {
                        KFImage(URL(string: "http://localhost:3000/users/\(self.cellViewModel.tweet.userId)/avatar"))
                            .resizable()
                            .placeholder({
                                Image("icn_user_placeholder")
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 65, height: 65)
                                    .clipShape(Circle())
                            })
                            .frame(width: 65, height: 65)
                            .clipShape(Circle())
                            .padding(.leading, 8)
                    }
                }
                VStack(alignment: .leading, spacing: 12, content: {(
                    Text(self.cellViewModel.tweet.name)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                    +
                    Text(" @\(self.cellViewModel.tweet.username)")
                        .foregroundColor(.gray)
                    )
                    
                    Text(self.cellViewModel.tweet.tweet)
                        .frame(maxHeight: 100, alignment: .top)
                        .font(.system(size: 14))
                    if let imageId = self.cellViewModel.tweet.id {
                        if self.cellViewModel.tweet.image == "true" {
                            GeometryReader { proxy in
                                KFImage(URL(string: "http://localhost:3000/tweets/\(imageId)/image"))
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: proxy.frame(in: .global).width, height: 200)
                                    .cornerRadius(15)
                            }.frame(height: 200).padding(.bottom, 10)
                        }
                    }
                    HStack(spacing: 50, content: {
                        Button(action: {
                            
                        }, label: {
                            Image("icn_comment")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }).foregroundColor(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            Image("icn_retweet")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }).foregroundColor(.gray)
                        
                        Button(action: {
                            self.isLiked ? self.cellViewModel.unlike() : self.cellViewModel.like()
                        }, label: {
                            self.isLiked ? Image("icn_like")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.red) : Image("icn_like")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(.gray)
                        }).foregroundColor(.gray)
                        
                        Button(action: {
                            
                        }, label: {
                            Image("house_fill")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 16, height: 16)
                        }).foregroundColor(.gray)
                    })
                })
                Spacer()
            })
        }
    }
}
