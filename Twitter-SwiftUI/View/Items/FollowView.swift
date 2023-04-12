//
//  FollowView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 23/01/2023.
//

import SwiftUI

struct FollowView: View {
    var count: Int
    var title: String
    
    var body: some View {
        HStack {
            Text("\(count)")
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text(title)
                .foregroundColor(.gray)
        }
    }
}
