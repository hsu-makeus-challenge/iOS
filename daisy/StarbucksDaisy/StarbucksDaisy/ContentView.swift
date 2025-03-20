//
//  ContentView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoginView = false
    
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}
