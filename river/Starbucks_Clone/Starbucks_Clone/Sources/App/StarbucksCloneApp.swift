import SwiftUI

@main
struct StarbucksCloneApp: App {
    @State private var showMainView: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                // Swift 5.9부터는 @EnvironmentObject 대신 @Environment(NavigationRouter.self)로도 가능
                MainTabView()
//                    .environment(router)
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
