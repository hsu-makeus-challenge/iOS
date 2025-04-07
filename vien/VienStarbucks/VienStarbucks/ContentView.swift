import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationStack {
                LoginView()
            }
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
