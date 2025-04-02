import SwiftUI

@main
struct StarbucksCloneApp: App {
    @State private var showMainView: Bool = false
    @StateObject private var appEnvironment = AppEnvironment(
        router: NavigationRouter(),
        authService: AuthService()
    )
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                // Swift 5.9부터는 @EnvironmentObject 대신 @Environment(NavigationRouter.self)로도 가능
                MainTabView()
                    .environmentObject(appEnvironment)
            } else {
                SplashView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            withAnimation {
                                showMainView = true
                            }
                        }
                    }
            }
        }
    }
}
