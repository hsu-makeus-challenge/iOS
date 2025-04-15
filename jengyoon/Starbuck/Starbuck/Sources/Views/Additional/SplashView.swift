//
//  SplashView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/19/25.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack(alignment: .center) {
            Color.primaryGreen
            VStack{
                Spacer().frame(height: 394)
                
                Image(.starbuck)
                    .resizable()
                    .frame(width: 168,height: 168)
                
                Spacer().frame(height: 394)
            }
        } //: ZStack
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
