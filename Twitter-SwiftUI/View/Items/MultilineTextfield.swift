//
//  MultilineTextfield.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 20/01/2023.
//

import SwiftUI

struct MultilineTextfield: UIViewRepresentable {
    
    func makeCoordinator() -> MultilineTextfield.Coordinator {
        return MultilineTextfield.Coordinator(parent: self)
    }
    
    @Binding var text: String
    
    func makeUIView(context: Context) -> some UITextView {
        let text = UITextView()
        text.isEditable = true
        text.isUserInteractionEnabled = true
        text.textColor = .gray
        text.text = "Type something."
        text.font = .systemFont(ofSize: 20)
        text.delegate = context.coordinator
        return text
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        var parent: MultilineTextfield
        
        init(parent: MultilineTextfield) {
            self.parent = parent
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            textView.text = ""
            textView.textColor = .black
        }
        
        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
