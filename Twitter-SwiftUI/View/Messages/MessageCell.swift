//
//  MessageCell.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 23/01/2023.
//

import SwiftUI

struct MessageCell: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("icn_user_placeholder")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 44, height: 44)
                    .background(.gray)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                VStack(alignment: .leading) {
                    HStack {
                        Text("Suraj ")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        +
                        Text("@suraj102")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("06/20/21")
                            .fontWeight(.light)
                            .foregroundColor(.gray)
                            .font(.system(size: 14))
                        
                    }
                    
                    Text("Here is your message send by ... Here is your message send by ... ")
                        .lineLimit(2)
                        .foregroundColor(.gray)
                }
            }.padding(.all, 12)
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.gray)
                .opacity(0.3)
            
            
        }
    }
}

struct MessageCell_Previews: PreviewProvider {
    static var previews: some View {
        MessageCell()
    }
}
