import SwiftUI

@main
struct StarbuckApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            AppRootView()
        }
    }
}
