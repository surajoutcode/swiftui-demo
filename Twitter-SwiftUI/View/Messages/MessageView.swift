//
//  MessageView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct MessageView: View {
    var body: some View {
        VStack {
            ScrollView(content: {
                ForEach(0..<9){ _ in
                    MessageCell()
                }
            })
        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView()
    }
}
