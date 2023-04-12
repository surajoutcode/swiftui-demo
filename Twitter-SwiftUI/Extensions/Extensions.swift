//
//  Extensions.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 26/01/2023.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
