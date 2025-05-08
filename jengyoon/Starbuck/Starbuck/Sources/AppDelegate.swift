//
//  AppDelegate.swift
//  Starbuck
//
//  Created by 송승윤 on 5/8/25.
//

import UIKit

final class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ app: UIApplication, open url: URL,
                     options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme == "myapp", url.host == "oauth" {
            if let code = URLComponents(string: url.absoluteString)?
                .queryItems?.first(where: { $0.name == "code" })?.value {
                
                // 인가 코드 Notification으로 전달
                NotificationCenter.default.post(
                    name: .didReceiveKakaoCode,
                    object: nil,
                    userInfo: ["code": code]
                )
            }
            return true
        }
        return false
    }
}

extension Notification.Name {
    static let didReceiveKakaoCode = Notification.Name("didReceieveKakaoCode")
}
