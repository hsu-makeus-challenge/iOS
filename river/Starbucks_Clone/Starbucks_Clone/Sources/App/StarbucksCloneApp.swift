import SwiftUI

@main
struct StarbucksCloneApp: App {
    @State private var showMainView: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if showMainView {
                LoginView()
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
