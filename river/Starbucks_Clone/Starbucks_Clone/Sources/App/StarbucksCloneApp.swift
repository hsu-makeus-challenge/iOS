import SwiftUI

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
