//
//  VienStarbucksApp.swift
//  VienStarbucks
//
//  Created by 이은정 on 3/20/25.
//
import SwiftUI

@main
struct VienStarbucksApp: App {
    @StateObject var kakaoAuthManager = KakaoAuthManager.shared

    var body: some Scene {
        WindowGroup {
            LoginView()
                .onOpenURL { url in
                    Task {
                        await kakaoAuthManager.handleRedirectURL(url)
                    }
                }
                .environmentObject(kakaoAuthManager)
        }
    }
}
