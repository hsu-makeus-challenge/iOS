import Foundation
import UIKit

class StarbucksCloneAppDelegate: NSObject, UIApplicationDelegate{
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        return true
    }
}
