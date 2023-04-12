//
//  LoginView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/02/2023.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var phoneEmail = "surajb@gmail.com"
    @State var password = "12345678"
    @State var emailDone = false
    
    @Environment(\.presentationMode) var presentatioMode
    
    var body: some View {
        if !emailDone {
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                presentatioMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Cancel")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Image("icn_tweet")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                    }
                }
                
                Text("To get started first enter your phone, email, or @username")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom)
                
                CustomTextField(placeholder: "Phone, email or username", text: $phoneEmail)
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {
                        if !phoneEmail.isEmpty {
                            self.emailDone.toggle()
                        }
                    }, label: {
                        Capsule()
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 40, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                            Text("Next")
                                .foregroundColor(.white)
                            )
                    })
                    .padding(.bottom, 4)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Forgot password?")
                            
                    })
                }
            }
        } else {
            VStack {
                VStack {
                    ZStack {
                        HStack {
                            Button(action: {
                                self.emailDone.toggle()
                            }, label: {
                                Text("Back")
                                    .foregroundColor(.blue)
                            })
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        Image("icn_tweet")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.blue)
                    }
                }
                
                Text("Enter your password")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .padding(.top)
                    .padding(.bottom)
                
                SecureTextField(placeholder: "Password", text: $password)
                
                Spacer(minLength: 0)
                
                VStack {
                    Button(action: {
                        viewModel.login(email: phoneEmail, password: password)
                    }, label: {
                        Capsule()
                            .frame(width: UIScreen.main.bounds.width*0.8, height: 40, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                            Text("Log In")
                                .foregroundColor(.white)
                            )
                    })
                    .padding(.bottom, 4)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Forgot password?")
                            
                    })
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
