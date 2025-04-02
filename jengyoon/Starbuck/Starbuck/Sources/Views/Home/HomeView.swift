//
//  HomeView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HomeBannerView()
            Spacer()
        } //: VStack
        
        .ignoresSafeArea()
    }
}

#Preview {
    HomeView()
}
