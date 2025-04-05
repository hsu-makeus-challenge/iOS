//
//  StarbucksDaisyApp.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import SwiftUI

@main
struct StarbucksDaisyApp: App {
//    var router = NavigationRouter() // 앱 전체에서 router 사용
    
    var body: some Scene {
        WindowGroup {
            ContentView()
//                .environment(router) // 전체 뷰에서 사용 가능하도록 주입
        }
    }
}
