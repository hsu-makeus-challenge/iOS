//
//  DesertView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct DesertView: View {
    @StateObject private var viewModel = DesertViewModel()
    /// 콘텐츠 높이에 맞춰 동적으로 늘어나며 1행으로 이루어진 아이템
    let rows = Array(repeating: GridItem(.adaptive(minimum: 150)), count: 1)
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            Text("하루가 달콤해지는 디저트")
                .font(.PretendardBold24)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 16) {
                    ForEach(viewModel.deserts) { deserts in
                        VStack (spacing: 10) {
                            Image(deserts.imageName)
                                .resizable()
                                .frame(width: 130, height: 130)
                            
                            Text(deserts.title)
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
    DesertView()
}
