//
//  Config.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/11/25.
//

import Foundation

enum Config {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist 없음")
        }
        return dict
    }()
    
    static let kakaoAPIKey: String = {
        guard let apiKey = Config.infoDictionary["KAKAO_API_KEY"] as? String else {
            fatalError()
        }
        return apiKey
    }()
    
    static let kakaoLoginBaseURL: String = {
        guard let loginURL = Config.infoDictionary["KAKAO_LOGIN_URL"] as? String else {
            fatalError()
        }
        return loginURL
    }()
    
    static let redirectURI: String = {
        guard let redirectURI = Config.infoDictionary["REDIRECT_URI"] as? String else {
            fatalError()
        }
        return redirectURI
    }()
}
