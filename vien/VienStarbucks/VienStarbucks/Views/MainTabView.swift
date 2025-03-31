import SwiftUI

struct MainTabView: View {
    //이미지 안됨
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView()
            }

            Tab("Pay", systemImage: "creditcard") {
                PayView()
            }

            Tab("Order", systemImage: "cup.and.saucer") {
                OrderView()
            }

            Tab("Shop", systemImage: "bag") {
                ShopView()
            }
            
            Tab("Other", systemImage: "ellipsis") {
                OtherView()
            }
            
        }
        .tint(.green02)
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
    MainTabView()
}
