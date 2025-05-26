import SwiftUI

@main
struct StarbucksCloneApp: App {
    @UIApplicationDelegateAdaptor(StarbucksCloneAppDelegate.self) private var appDelegate
    @StateObject private var appEnvironment = AppEnvironment(
        router: NavigationRouter(),
        authService: AuthService(),
        authStore: AuthStore(),
        locationManager: .shared
    )
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appEnvironment)
        }
    }
}
