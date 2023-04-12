//
//  SlideMenu.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 23/01/2023.
//

import SwiftUI
import Kingfisher

struct SlideMenu: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var showMenu = false
    
    var menuButtons = ["Profile", "Lists", "Topics", "Bookmarks", "Moments"]
        
    var body: some View {
        let _ = Self._printChanges()
        GeometryReader { proxy in
            VStack {
                HStack(spacing: 0, content: {
                    VStack(alignment: .leading, content: {
                        NavigationLink(destination: UserProfile(user: viewModel.currentUser!, authModel: viewModel)) {
                            KFImage(URL(string: "http://localhost:3000/users/\(self.viewModel.currentUser?.id ?? "")/avatar"))
                                .resizable()
                                .placeholder({
                                    Image("icn_user_placeholder")
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 65, height: 65)
                                        .clipShape(Circle())
                                })
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                                .padding(8)
                                .background(.white)
                                .clipShape(Circle())
                        }
                        
                        HStack(alignment: .top, spacing: 12, content: {
                            VStack(alignment: .leading, spacing: 12, content: {
                                NavigationLink(destination: UserProfile(user: viewModel.currentUser!, authModel: viewModel)) {
                                    Text(viewModel.currentUser?.name ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                Text(viewModel.currentUser?.email ?? "")
                                    .foregroundColor(.gray)
                                
                                HStack(spacing: 020, content: {
                                    FollowView(count: viewModel.currentUser?.followers.count ?? 0, title: "Followers")
                                    FollowView(count: viewModel.currentUser?.followings.count ?? 0, title: "Following")
                                })
                                .padding(.top, 10)
                                Divider()
                                    .padding(.top, 10)
                                    
                            })
                            
                            Spacer(minLength: 0)
                            
                            Button(action: {
                                withAnimation {
                                    self.showMenu.toggle()
                                }
                            }, label: {
                                Image(systemName: showMenu ? "chevron.down" : "chevron.up")
                                    .foregroundColor(.blue)
                            })
                        })
                        
                        VStack(alignment: .leading) {
                            ForEach(menuButtons, id:\.self) { item in
                                MenuButton(image: "house_fill", title: item)
                            }
                            
                            Divider()
                                .padding(.top)
                            
                            Button(action: {
                                
                            }, label: {
                                MenuButton(image: "house_fill", title: "Twitter Ads")
                            })
                            
                            Divider()
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Settings and privacy")
                                    .foregroundColor(.black)
                            })
                            .padding(.top, 20)
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Help Center")
                                    .foregroundColor(.black)
                            })
                            .padding(.top)
                            
                            Spacer(minLength: 0)
                            
                            Divider()
                                .padding(.bottom)
                            
                            HStack {
                                Button(action: {
                                    
                                }, label: {
                                    Image("house_fill")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(.blue)
                                })
                                
                                Spacer(minLength: 0)
                                
                                Button(action: {
                                    
                                }, label: {
                                    Image("house_fill")
                                        .renderingMode(.template)
                                        .resizable()
                                        .frame(width: 26, height: 26)
                                        .foregroundColor(.blue)
                                })
                            }
                        }
                        .opacity(showMenu ? 1 : 0)
                        .frame(height: showMenu ? nil : 0)
                        
                        VStack(alignment: .leading, content: {
                            Button(action: {
                                
                            }, label: {
                                Text("Create a new account")
                                    .foregroundColor(.blue)
                            })
                            .padding(.top, 8)
                            
                            Button(action: {
                                
                            }, label: {
                                Text("Add an existing account")
                                    .foregroundColor(.blue)
                            })
                            .padding(.top, 8)
                            
                            Spacer(minLength: 0)
                        })
                        .opacity(!showMenu ? 1 : 0)
                        .frame(height: !showMenu ? nil : 0)
                        
                    })
                    .padding(.horizontal, 20)
//                    .padding(.top, proxy.safeAreaInsets.top == 0 ? 15 : proxy.safeAreaInsets.top)
//                    .padding(.bottom, proxy.safeAreaInsets.bottom == 0 ? 15 : proxy.safeAreaInsets.bottom)
                    .frame(width: UIScreen.main.bounds.width - 90)
                    .background(.white)
//                    .ignoresSafeArea(.all, edges: .vertical)
                    Spacer(minLength: 0)
                    
                })
            }
        }
    }
}

struct SlideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenu()
    }
}
