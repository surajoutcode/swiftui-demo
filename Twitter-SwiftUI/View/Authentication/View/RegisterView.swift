//
//  RegisterView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/02/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @State var firstName = ""
    @State var middleName = ""
    @State var lastName = ""
    @State var phoneEmail = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @Environment(\.presentationMode) var presentatioMode
    
    var body: some View {
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
            Text("Create your account")
                .font(.title)
                .bold()
                .padding(.top, 36)
            
            VStack(alignment: .leading, spacing: nil, content: {
                CustomTextField(placeholder: "First Name", text: $firstName)
                CustomTextField(placeholder: "Middle Name", text: $middleName)
                CustomTextField(placeholder: "Last Name", text: $lastName)
                CustomTextField(placeholder: "Phone number or email", text: $phoneEmail)
                SecureTextField(placeholder: "Password", text: $password)
                SecureTextField(placeholder: "Confirm Password", text: $confirmPassword)
            })
            Spacer(minLength: 0)
            
            VStack {
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
                
                HStack{
                    Spacer()
                    
                    Button(action: {
                        let data = RegisterInfo(name: "\(firstName) \(lastName)", email: phoneEmail, username: "\(firstName).\(lastName)", password: password, bio: "This is a test bio", website: "https://www.surajbhandari.com.np")
                        self.viewModel.register(data: data)
                    }, label: {
                        Capsule()
                            .frame(width: 60, height: 30, alignment: .center)
                            .foregroundColor(.blue)
                            .overlay(
                                Text("Next")
                                    .foregroundColor(.white)
                            )
                    })
                }
                .padding(.trailing, 24)
            }
        }
        .onReceive(viewModel.$isRegisterComplete) { complete in
            if(complete) {
                presentatioMode.wrappedValue.dismiss()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
