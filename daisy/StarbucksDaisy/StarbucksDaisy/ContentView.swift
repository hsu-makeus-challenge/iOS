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
//                TabbarView()
                // 로그인이 되었으면 탭바
                // 안됐으면 로그인
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
