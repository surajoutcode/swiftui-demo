//
//  MenuButton.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 23/01/2023.
//

import SwiftUI

struct MenuButton: View {
    var image: String
    var title: String
    var body: some View {
        HStack(spacing: 15, content: {
            Image(image)
                .resizable()
                .renderingMode(.template)
                .frame(width: 24, height: 24)
                .foregroundColor(.gray)
            
            Text(title)
                .foregroundColor(.black)
            
            Spacer(minLength: 0)
        })
        .padding(.vertical, 12)
    }
}
