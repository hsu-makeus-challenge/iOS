import SwiftUI
import SwiftData

enum AppSchema {
    static let modelTypes: [any PersistentModel.Type] = [
        PayCard.self
        // 나중에 모델 추가 시 여기에만 추가
    ]
}

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
        .modelContainer(for: AppSchema.modelTypes)
    }
}
