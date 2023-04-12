//
//  WelcomeView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/02/2023.
//

import SwiftUI

struct WelcomeView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    
                    Image("icn_tweet")
                        .resizable()
                        .scaledToFill()
                        .padding(.trailing)
                        .frame(width: 20, height: 20)
                    
                    Spacer(minLength: 0)
                }
                
                Spacer(minLength: 0)
                
                Text("See what's happening in the world right now.")
                    .font(.system(size: 30, weight: .heavy, design: .default))
                    .frame(width: UIScreen.main.bounds.width * 0.9, alignment: .center)
                
                Spacer(minLength: 0)
                
                VStack(alignment: .center, spacing: 16, content: {
                    Button(action: {
                        
                    }, label: {
                        HStack(spacing: 0, content: {
                            Image("google")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            
                            Text("Continue with Google")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        })
                        .overlay(
                        RoundedRectangle(cornerRadius: 36)
                            .stroke(Color.black, lineWidth: 1)
                            .opacity(0.3)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 60, alignment: .center)
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        HStack(spacing: 0, content: {
                            Image("facebook")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 32, height: 32)
                            
                            Text("Continue with Facebook")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.black)
                                .padding()
                        })
                        .overlay(
                        RoundedRectangle(cornerRadius: 36)
                            .stroke(Color.black, lineWidth: 1)
                            .opacity(0.3)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 60, alignment: .center)
                        )
                        .frame(width: UIScreen.main.bounds.width * 0.8)
                    })
                    HStack {
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: UIScreen.main.bounds.width
                                   * 0.35, height: 1)
                        
                        Text("Or")
                            .foregroundColor(.gray)
                        
                        Rectangle()
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            .frame(width: UIScreen.main.bounds.width
                                   * 0.35, height: 1)
                    }
                    NavigationLink(destination: RegisterView().navigationBarHidden(true), label: {
                        RoundedRectangle(cornerRadius: 36)
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: 60, alignment: .center)
                            .overlay(
                            Text("Create account")
                                .fontWeight(.bold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .padding()
                            )
                    })
                })
                .padding()
                
                VStack(alignment: .leading, content: {
                    VStack {
                        Text("By signing up, you agree to our ")
                        +
                        Text("Terms")
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                        +
                        Text(", ")
                        +
                        Text("Privacy Policy")
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                        +
                        Text(" and ")
                        +
                        Text("Cookies Use")
                            .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                    }
                    .padding(.bottom)
                    
                    HStack(spacing: 2) {
                        Text("Have an account already? ")
                        NavigationLink(destination: LoginView().navigationBarHidden(true), label: {
                            Text("Log In")
                                .foregroundColor(Color(red: 29/255, green: 161/255, blue: 242/255))
                        })
                    }
                })
            }
        }
        .navigationBarHidden(true)
        .navigationBarTitle("")
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
