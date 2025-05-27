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
    
    static let kakaoRestAPIKey: String = {
        guard let apiKey = Config.infoDictionary["KAKAO_REST_API_KEY"] as? String else {
            fatalError()
        }
        return apiKey
    }()
    
    static let kakaoBaseURL: String = {
        guard let url = Config.infoDictionary["KAKAO_URL"] as? String else {
            fatalError()
        }
        return url
    }()
    
    static let osrmURL: String = {
        guard let url = Config.infoDictionary["OSRM_URL"] as? String else {
            fatalError()
        }
        return url
    }()
}
