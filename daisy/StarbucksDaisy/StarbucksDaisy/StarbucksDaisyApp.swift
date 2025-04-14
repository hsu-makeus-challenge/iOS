//
//  StarbucksDaisyApp.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import SwiftUI
import SwiftData

@main
struct StarbucksDaisyApp: App {
    @StateObject private var router = NavigationRouter() // 앱 전체에서 router 사용
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(router) // 전체 뷰에서 사용 가능하도록 주입
        }
        .modelContainer(for: Receipt.self) // Receipt 모델을 저장하고 불러올 저장소
    }
}
