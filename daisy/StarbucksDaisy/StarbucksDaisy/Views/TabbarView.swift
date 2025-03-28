//
//  TapbarView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 3/27/25.
//

import SwiftUI

struct TabbarView: View {
    var body: some View {
        TabView() {
            Tab("Home", systemImage: "house.fill") {
                HomeView()
            }
            Tab ("Pay", systemImage: "creditcard.fill") {
                PayView()
            }
            Tab("Order", systemImage: "mug.fill") {
                OrderView()
            }
            Tab("Shop", systemImage: "bag.fill") {
                ShopView()
            }
            Tab("Other", systemImage: "ellipsis") {
                OtherView()
            }
        }
        .tint(Color.green02)
    }
}

#Preview {
    TabbarView()
}
