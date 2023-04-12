//
//  UserProfile.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 24/01/2023.
//

import SwiftUI
import Kingfisher

struct UserProfile: View {
        
    let user: UserInfo

    let authModel: AuthViewModel
                
    @ObservedObject var profileViewModel: ProfileViewModel
    
    @State var offset: CGFloat = 0
    @State var titleOffset: CGFloat = 0
    
    @State var currentTab = "Tweets"
    @Namespace var animation
    
    @State var tabBarOffset: CGFloat = 0
    
    @State var editProfileShow = false
    
    var isFollowed: Bool {
        return profileViewModel.user.isFollowed ?? false
    }
    
    let userRepo = UserProvider.shared.makeUserRepository()
    let tweetRepo = TweetProvider.shared.makeTweetRepository()
    let notificationRepo = NotificationProvider.shared.makeNotificationRepository()
    
    init(user: UserInfo, authModel: AuthViewModel) {
        self.user = user
        self.authModel = authModel
        self.profileViewModel = ProfileViewModel(user: user, currentUser: authModel.currentUser!, userRepository: userRepo, tweetRepository: tweetRepo, notificationRepository: notificationRepo)
    }
    
    var body: some View {
        let _ = Self._printChanges()
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15) {
                
                GeometryReader{ proxy -> AnyView in
                    let minY = proxy.frame(in: .global).minY
                    DispatchQueue.main.async {
                        self.offset = minY
                    }
                    return AnyView(
                        ZStack {
                            Image("house_fill")
                                .renderingMode(.template)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: minY > 0 ? 180 + minY : 180, alignment: .center)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(0)
                            
                            BlurView()
                                .opacity(blurView())
                            
                            VStack(spacing: 0, content: {
                                Text(self.user.name)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                Text("150 tweets")
                                    .foregroundColor(.white)
                            })
                            .offset(y: 120)
                            .offset(y: titleOffset > 100 ? 0 : -getTitleOffset())
                            .opacity(titleOffset < 100 ? 1 : 0)
                        }
                            .clipped()
                            .frame(height: minY > 0 ? 180 + minY : nil)
                            .offset(y: minY > 0 ? -minY : -minY < 80 ? 0 : -minY - 80)
                    )
                }
                .frame(height: 180)
                .zIndex(1)
                VStack {
                    HStack {
                        KFImage(URL(string: "http://localhost:3000/users/\(self.profileViewModel.user.id)/avatar"))
                            .resizable()
                            .placeholder({
                                Image("house_fill")
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 75, height: 75)
                                    .clipShape(Circle())
                            })
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 75, height: 75)
                            .clipShape(Circle())
                            .padding(8)
                            .background(.white)
                            .background(Color.white.clipShape(Circle()))
                            .clipShape(Circle())
                            .offset(y: offset < 0 ? getOffset() - 20 : -20)
                            .scaleEffect(getScale())
                        
                        Spacer()
                        
                        if(self.profileViewModel.user.isCurrentUser == true) {
                            Button(action: {
                                self.editProfileShow.toggle()
                            }, label: {
                                Text("Edit Profile")
                                    .foregroundColor(.blue)
                                    .padding(.vertical, 8)
                                    .padding(.horizontal)
                                    .background(Capsule().stroke(.blue, lineWidth: 1.5))
                            })
                            .sheet(isPresented: $editProfileShow, content: {
                                EditProfileView(user: $profileViewModel.user)
                            })
                        }else {
                            Button(action: {
                                isFollowed ? self.profileViewModel.unFollow() : self.profileViewModel.follow()
                            }, label: {
                                Text(isFollowed ? "Following" : "Follow")
                                    .foregroundColor(isFollowed ? .black : .white)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal)
                                    .background(
                                        
                                        ZStack {
                                            Capsule()
                                                .stroke(Color.black, lineWidth: isFollowed ? 1.5 : 0)
                                                .foregroundColor(isFollowed ? .white : .black)
                                            Capsule()
                                                .foregroundColor(isFollowed ? .white : .black)
                                        }
                                )
                            })
                        }
                    }
                    .padding(.top, -25)
                    .padding(.bottom, -10)
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 8, content: {
                            Text(self.user.name)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            
                            Text("@\(self.user.username)")
                                .foregroundColor(.gray)
                            
                            Text(self.user.bio ?? "")
                            
                            HStack(spacing: 8) {
                                if let userLocation = self.user.location {
                                    if(userLocation != "") {
                                        HStack(spacing: 2) {
                                            Image(systemName: "mappin.circle.fill")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(userLocation)
                                                .foregroundColor(.gray)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                                
                                if let website = self.user.website {
                                    if(website != "") {
                                        HStack(spacing: 2) {
                                            Image(systemName: "link")
                                                .frame(width: 24, height: 24)
                                                .foregroundColor(.gray)
                                            Text(website)
                                                .foregroundColor(.blue)
                                                .font(.system(size: 14))
                                        }
                                    }
                                }
                            }
                            
                            HStack(spacing: 8, content: {
                                FollowView(count: self.user.followers.count, title: "Followers")
                                FollowView(count: self.user.followings.count, title: "Following")
                            })
                        }).padding(8)
                            .overlay(
                                GeometryReader { proxy -> Color in
                                    let minY = proxy.frame(in: .global).minY
                                    DispatchQueue.main.async {
                                        self.titleOffset = minY
                                    }
                                    return Color.clear
                                }
                                    .frame(width: 0, height: 0, alignment: .top)
                            )
                        Spacer()
                    }
                    
                    VStack(spacing: 0, content: {
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(spacing: 0, content: {
                                TabButton(title: "Tweets", curretTab: $currentTab, animation: animation)
                                TabButton(title: "Tweets & Feeds", curretTab: $currentTab, animation: animation)
                                TabButton(title: "Media", curretTab: $currentTab, animation: animation)
                                TabButton(title: "Likes", curretTab: $currentTab, animation: animation)
                            })
                        })
                        Divider()
                    })
                    .padding(.top, 20)
                    .background(.white)
                    .offset(y: tabBarOffset < 90 ? -tabBarOffset + 90 : 0)
                    .overlay (
                        GeometryReader { proxy -> Color in
                            let minY = proxy.frame(in: .global).minY
                            DispatchQueue.main.async {
                                self.tabBarOffset = minY
                            }
                            return Color.clear
                        }
                        .frame(width: 0, height: 0)
                        , alignment: .top
                    )
                    .zIndex(1)
                    
                    LazyVStack(spacing: 18, content: {
                        ForEach(profileViewModel.tweets) { tweet in
                            TweetCellView(cellViewModel: TweetCellViewModel(tweet: tweet, currentUser: authModel.currentUser!, userRepository: userRepo, tweetRepository: tweetRepo, notificationRepository: notificationRepo))
                            Divider()
                        }
                    })
                    .padding(.top)
                    .zIndex(0)

                }
                .padding(.horizontal, 12)
                .zIndex(-offset > 80 ? 0 : 1)
            }
        }
        .ignoresSafeArea(.all, edges: .top)
    }
    
    func blurView() -> Double {
        let progress = -(offset + 80) / 150
        return Double(-offset > 80 ? progress : 0)
    }
    
    func getTitleOffset() -> CGFloat {
        let progress = 20 / titleOffset
        let offset = 60 * (progress > 0 && progress <= 1 ? progress : 1)
        return offset
    }
    
    func getOffset() -> CGFloat {
        let progress = (-offset / 80) / 150
        return progress <= 20 ? progress : 20
    }
    
    func getScale() -> CGFloat {
        let progress = -offset / 80
        let scale = 1.8 - (progress < 1.0 ? progress : 1)
        return scale < 1 ? scale : 1
    }
}
