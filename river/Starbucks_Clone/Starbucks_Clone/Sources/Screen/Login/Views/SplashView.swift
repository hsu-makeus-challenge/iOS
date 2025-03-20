//
//  SplashView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/20/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color(.green01)
            Image(.starbuckLogo)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
