//
//  CreateTweetView.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct CreateTweetView: View {
    
    @EnvironmentObject var authModel: AuthViewModel
    @ObservedObject var viewModel = CreateTweetViewModel(tweetRepository: TweetProvider.shared.makeTweetRepository())
    
    @Environment(\.presentationMode) var presentatioMode
    
    @State var text = ""
    
    @State var imagePickerPresented = false
    @State var selectedImage: UIImage?
    @State var postImage: Image?
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentatioMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                })
                Spacer()
                Button(action: {
                    let data = TweetInfo(tweet: text, userId: authModel.currentUser?.id ?? "", user: authModel.currentUser?.name ?? "", username: authModel.currentUser?.username ?? "", image: selectedImage?.pngData())
                    viewModel.uploadPost(data: data)
                }, label: {
                    Text("Tweet").padding(.vertical, 8).padding(.horizontal)
                })
                .background(.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
            MultilineTextfield(text: $text)
            if postImage == nil {
                Button {
                    self.imagePickerPresented.toggle()
                } label: {
                    Image(systemName: "plus.circle")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 70, height: 70)
                        .clipped()
                        .foregroundColor(.black)
                }.sheet(isPresented: $imagePickerPresented) {
                    loadImage()
                } content: {
                    ImagePicker(image: $selectedImage)
                }
            }
            else if let image = postImage {
                VStack {
                    
                    HStack(alignment: .top) {
                        image
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                            .frame(width: UIScreen.main.bounds.width * 0.9)
                            .cornerRadius(16)
                            .clipped()
                    }
                }
            }
        }
        .padding()
        .onReceive(viewModel.$uploadComplete) { complete in
            if complete {
                self.presentatioMode.wrappedValue.dismiss()
            }
        }
    }
}

extension CreateTweetView {
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
        postImage = Image(uiImage: selectedImage)
    }
}

struct CreateTweetView_Previews: PreviewProvider {
    static var previews: some View {
        CreateTweetView()
    }
}
