//
//  ContentView.swift
//  Starbuck
//
//  Created by 송승윤 on 3/27/25.
//

import SwiftUI

/// TabView 선언, Button 선언 방식과 유사한것같음
struct StarBuckTab: View {
    var body: some View {
        TabView {
            
            Tab {
                EmptyView()
            } label: {
                Label {
                    Text("Home")
                }
                icon: {
                    Image("home")
                }
            } //: label
            
            Tab {
                EmptyView()
            } label: {
                Label {
                    Text("Pay")
                }
                icon: {
                    Image("pay")
                }
            } //: label
            
            Tab {
                EmptyView()
            } label: {
                Label {
                    Text("Order")
                }
                icon: {
                    Image("order")
                }
            } //: label
            
            Tab {
                EmptyView()
            } label: {
                Label {
                    Text("Shop")
                }
                icon: {
                    Image("shop")
                }
            } //: label
            
            Tab {
                OtherView()
            } label: {
                Label {
                    Text("Other")
                }
                icon: {
                    Image("other")
                }
            } //: label
            
        } //: TabView
        .tint(Color.primaryGreen)
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}


struct PayView: View {
    var body: some View {
        Text("Pay")
    }
}


struct OrderView: View {
    var body: some View {
        Text("Order")
    }
}


struct ShopView: View {
    var body: some View {
        Text("Shop")
    }
}

#Preview {
    StarBuckTab()
}
