//
//  TabButton.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 24/01/2023.
//

import SwiftUI

struct TabButton: View {
    var title: String
    @Binding var curretTab: String
    var animation: Namespace.ID
    
    var body: some View {
        Button(action: {
            curretTab = title
        }, label: {
            LazyVStack(spacing: 12) {
                Text(title)
                    .fontWeight(.semibold)
                    .foregroundColor(curretTab == title ? .blue : .gray)
                    .padding(.horizontal)
                
                if curretTab == title {
                    Capsule()
                        .fill(Color.blue)
                        .frame(height: 1.2)
                        .matchedGeometryEffect(id: "TAB", in: animation)
                } else {
                    Capsule()
                        .fill(Color.clear)
                        .frame(height: 1.2)
                }
            }
        })
    }
}
