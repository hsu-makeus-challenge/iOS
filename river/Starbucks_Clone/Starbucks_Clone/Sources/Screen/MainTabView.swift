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
                EmptyView()
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
                EmptyView()
            }
        }
        .tint(Color("green02"))
    }
}

#Preview {
    MainTabView()
}
