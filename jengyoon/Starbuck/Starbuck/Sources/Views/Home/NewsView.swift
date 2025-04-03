//
//  NewsView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import SwiftUI

struct NewsView: View {
    /// News뷰에게 해당 객체 소유권이 있음, 상태 바뀔시 랜더링
    @StateObject private var viewModel = NewsViewModel()
    /// 콘텐츠 높이에 맞춰서 동적으로 늘어나며 1행으로 이루어진 아이템
    let rows = Array(repeating: GridItem(.flexible()), count: 1)

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Whats New")
                .font(.PretendardBold24)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: rows, spacing: 16) {
                    ForEach(viewModel.news) { news in
                        VStack (alignment: .leading, spacing: 16) {
                            Image(news.imageName)
                                .resizable()
                                .frame(width: 240, height: 160)
                            
                            Text(news.title)
                                .font(.PretendardRegular18)
                            
                            Text(news.content)
                                .font(.PretendardRegular13)
                                .frame(height: 36)
                                .foregroundStyle(Color.gray)
                        }
                        .frame(width:242, height: 160)
                    }
                } //: LazyHGrid
            } //: ScrollView
            .frame(height: 250)
        } //: VStack
    }
    
}

#Preview {
    NewsView()
}
