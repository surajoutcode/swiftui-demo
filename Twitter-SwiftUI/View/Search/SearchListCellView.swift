//
//  SearchListCellView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI
import Kingfisher

struct SearchListCellView: View {
    
    let user: UserInfo
    
    var body: some View {
        HStack {
            KFImage(URL(string: "http://localhost:3000/users/\(self.user.id)/avatar"))
                .resizable()
                .placeholder({
                    Image("icn_user_placeholder")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .background(.gray)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                })
                .scaledToFit()
                .frame(width: 44, height: 44)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(user.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Text(user.username)
                    .foregroundColor(.black)
                
            }
            
            Spacer(minLength: 0)
        }
    }
}
