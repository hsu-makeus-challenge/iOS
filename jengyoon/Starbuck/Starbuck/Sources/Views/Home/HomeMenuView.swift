//
//  HomeMenuView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

/// 추천메뉴
struct HomeMenuView: View {
    @StateObject private var viewModel = HomeViewModel()
    /// 콘텐츠 높이에 맞춰 동적으로 늘어나며 1행으로 이루어진 아이템
    let rows = Array(repeating: GridItem(.adaptive(minimum: 150)), count: 1)
    
    var body: some View {
        VStack (spacing: 20) {
            HStack {
                Group {
                    Text("\(viewModel.displayName)")
                        .foregroundStyle(Color("brown01"))
                    Text("님을 위한 추천 메뉴")
                    Spacer()
                }
                .font(.PretendardBold24)
            } //: TextGroupHStack
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 16) {
                    ForEach(viewModel.menus) { menu in
                        VStack (spacing: 10) {
                            Image(menu.imageName)
                                .resizable()
                                .frame(width: 130, height: 130)
                            
                            Text(menu.coffee)
                                .font(.PretendardLight14)
                        }
                    }
                }
            }//: CoffeeScrollView
            .frame(height: 160)

        } //: VStack
    }
}

#Preview {
    HomeMenuView()
}
