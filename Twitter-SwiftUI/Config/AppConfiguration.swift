//
//  AppConfiguration.swift
//  Twitter-SwiftUI
//
//  Created by Suraj Bhandari on 02/03/2023.
//

import Foundation

final class AppConfiguration {
    
    lazy var apiBaseURL: URL = {
        guard let apiBaseURL = Bundle.main.object(forInfoDictionaryKey: "ApiBaseURL") as? String else {
            fatalError("ApiBaseURL must not be empty in plist")
        }
        let urlString = apiBaseURL.replacingOccurrences(of: "\\", with: "")
        guard let url = URL(string: urlString) else {
            fatalError("AppConfiguration: - Couldnot generate BaseUrl")
        }
        return url
    }()
}
