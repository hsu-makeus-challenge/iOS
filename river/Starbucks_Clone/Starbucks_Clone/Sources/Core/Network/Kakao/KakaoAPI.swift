//
//  KakaoAPI.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/26/25.
//

import Foundation
import Moya

enum KakaoAPI: APITargetType {
    case addressSearch(query: String)
}

extension KakaoAPI {
    var baseURL: URL {
        guard let url = URL(string: Config.kakaoBaseURL) else {
            fatalError("Not found kakao url")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .addressSearch:
            return "v2/local/search/keyword.json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .addressSearch: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .addressSearch(let query):
            return .requestParameters(parameters: [
                "query": query,
                "size": 15,
                "page": 1
            ], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return [
            "Authorization" : "KakaoAK \(Config.kakaoRestAPIKey)"
        ]
    }
}
