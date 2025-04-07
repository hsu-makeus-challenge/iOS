//
//  ContentView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var router: NavigationRouter
    @State private var showLoginView = false
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                if showLoginView {
                    LoginView()
                } else {
                    SplashView()
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { withAnimation {
                                self.showLoginView.toggle()}
                            }
                        }
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .emailLogin:
                    SignupView()
                case .coffeDetail(let coffee):
                    CoffeeDetailView(coffee: coffee)
                case .mainTabBar:
                    TabbarView()
                }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
