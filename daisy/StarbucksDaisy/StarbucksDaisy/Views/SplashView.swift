//
//  SplashView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/20/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color.green01
                .ignoresSafeArea()
            
            Image("starbucksLogo")
                .resizable()
                .frame(width: 168, height: 168)
        }
    }
}

#Preview {
    SplashView()
}
