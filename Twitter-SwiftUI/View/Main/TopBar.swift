//
//  TopBar.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 23/01/2023.
//

import SwiftUI

struct TopBar: View {
    
    @Binding var x: CGFloat
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        x = 0
                    }
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .font(.system(size: 24))
                        .foregroundColor(.blue)
                })
                
                Spacer(minLength: 0)
                
                Image("icn_tweet")
                    .renderingMode(.template)
                    .resizable()
                    .scaledToFill()
                    .padding(.trailing)
                    .frame(width: 20, height: 20)
                    .foregroundColor(.blue)
                
                Spacer(minLength: 0)
            }
            .padding()
            
            Rectangle()
                .frame(width: UIScreen.main.bounds.width, height: 1)
                .foregroundColor(.gray)
                .opacity(0.3)
        }
        .background(.white)
    }
}
