//
//  TapbarView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct TabbarView: View {
    @State private var selection: Int = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(
                "Home",
                image: selection == 0
                ? "home_selected"
                : "home", value: 0
            ) {
                SignupView()
            }
            
            Tab(
                "Pay",
                image: selection == 1
                ? "pay_selected"
                : "pay", value: 1
            ) {
                PayView()
            }

            Tab(
                "Order",
                image: selection == 2
                ? "order_selected"
                : "order", value: 2
            ) {
                OrderView()
            }
            
            Tab(
                "Shop",
                image: selection == 3
                ? "shop_selected"
                : "shop", value: 3
            ) {
                ShopView()
            }
            
            Tab(
                "Other",
                image: selection == 4
                ? "other_selected"
                : "other", value: 4
            ) {
                OtherView()
            }
        }
        .tint(Color.green02)
    }
}

#Preview {
    TabbarView()
}
