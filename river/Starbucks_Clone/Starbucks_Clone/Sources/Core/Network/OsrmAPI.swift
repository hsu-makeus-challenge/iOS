//
//  OsrmAPI.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/21/25.
//

import Foundation
import Moya

enum RouteType: String {
    case route
    case nearest
    case match
    case trip
}

enum ProfileType: String {
    case driving
    case foot
    case bicycle
}

enum OsrmAPI: APITargetType {
    case requestRoute(
        route: RouteType,
        profile: ProfileType,
        coordinates: [Coordinator]
    )
}

extension OsrmAPI {
    var baseURL: URL {
        guard let url = URL(string: Config.osrmURL) else {
            fatalError("유효하지 않은 URL 입니다.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case let .requestRoute(route, profile, coordinates):
            print("route: \(route.rawValue)")
            print("profile: \(profile.rawValue)")
            print("coordinates: \(coordinates)")
            let coordString = coordinates
                .map { "\($0.longitude),\($0.latitude)" }
                .joined(separator: ";")
            let routingUrl = "/\(route.rawValue)/v1/\(profile.rawValue)/\(coordString)"
            return routingUrl
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Moya.Task {
        switch self {
        case .requestRoute:
            return .requestParameters(
                parameters: ["geometries": "geojson"],
                encoding: URLEncoding.default
            )
        }
    }
}
