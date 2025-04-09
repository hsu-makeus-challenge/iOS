//
//  MainTabView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct MainTabView: View {
    
    @EnvironmentObject private var env: AppEnvironment
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(
                "Home",
                image: selection == 0
                ? "homeIcon_selected"
                : "homeIcon", value: 0
            ) {
                HomeView(homeViewModel: env.makeHomeVieModel())
            }
            
            Tab(
                "Pay",
                image: selection == 1
                ? "payIcon_selected"
                : "payIcon", value: 1
            ) {
                EmptyView()
            }
            
            Tab(
                "Order",
                image: selection == 2
                ? "orderIcon_selected" : "orderIcon",
                value: 2
            ) {
                EmptyView()
            }
            
            Tab(
                "Shop",
                image: selection == 3
                ? "shopIcon_selected" : "shopIcon",
                value: 3
            ) {
                EmptyView()
            }
            
            Tab(
                "Other",
                image: selection == 4
                ? "otherIcon_selected"
                : "otherIcon", value: 4
            ) {
                OtherView()
            }
        }
        .tint(Color("green02"))
        .navigationBarBackButtonHidden()
    }
}

struct MainTabView_Preview: PreviewProvider {
    static var previews : some View {
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            MainTabView()
                .environmentObject(AppEnvironment.previewEnv)
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}
