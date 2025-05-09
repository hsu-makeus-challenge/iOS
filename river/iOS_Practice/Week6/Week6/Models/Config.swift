//
//  Config.swift
//  Weak6
//
//  Created by jaewon Lee on 5/8/25.
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
        guard let baseURL = Config.infoDictionary["KAKAO_API_KEY"] as? String else {
            fatalError()
        }
        return baseURL
    }()
}
