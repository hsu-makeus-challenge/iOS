import SwiftUI

enum PREVIEW_DEVICE_TYPE : String, CaseIterable {
    case iPhone_15_Pro = "iPhone 16 Pro"
    case iPhone_11 = "iPhone 11"
}

@main
struct StarbucksCloneApp: App {
    @StateObject private var appEnvironment = AppEnvironment(
        router: NavigationRouter(),
        authService: AuthService(),
        authStore: AuthStore()
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appEnvironment)
        }
    }
}
