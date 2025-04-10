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
        ZStack {
            NavigationStack(path: $router.path) {
                if showLoginView {
                    LoginView()
                        .navigationDestination(for: Route.self) { route in
                            switch route {
                            case .emailLogin:
                                SignupView()
                            case .coffeDetail(let coffee):
                                CoffeeDetailView(coffee: coffee)
                            case .mainTabBar:
                                TabbarView()
                            case .mobileReceipt:
                                ReceiptView()
                            }
                        }
                } else {
                    SplashView()
                        .onAppear() {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) { withAnimation {
                                self.showLoginView.toggle()}
                            }
                        }
                }
            }
        }
    }
}


//#Preview {
//    ContentView()
//}
