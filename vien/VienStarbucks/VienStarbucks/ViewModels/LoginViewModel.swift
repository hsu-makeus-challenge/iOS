import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var pwd: String = ""
}
