//
//  MainTabView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

struct MainTabView: View {
    
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(
                "Home",
                image: selection == 0
                ? "homeIcon_selected"
                : "homeIcon", value: 0
            ) {
                // FIXME: 테스트를 위한 LoginView 생성
                LoginView()
            }
            
            Tab(
                "Pay",
                image: selection == 1
                ? "payIcon_selected"
                : "payIcon", value: 1
            ) {
                // FIXME: 테스트를 위한 SignupView 생성
                SignupView()
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
    }
}

struct MainTabView_Preview: PreviewProvider {
    static var previews : some View {
        ForEach(
            PREVIEW_DEVICE_TYPE.allCases,
            id: \.self
        ) { deviceType in
            MainTabView()
                .previewDevice(
                    PreviewDevice(rawValue: deviceType.rawValue))
                .previewDisplayName(deviceType.rawValue)
            
        }
    }
}
