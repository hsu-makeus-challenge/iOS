//
//  ShortcutButtonView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

/// 바로가기 버튼 뷰
struct ShortcutButtonView: View {
    
    private var image: ImageResource
    private var imageLabel: String
    
    init(
        image: ImageResource,
        imageLabel: String
    ) {
        self.image = image
        self.imageLabel = imageLabel
    }
    
    var body: some View {
        Button {
            print("\(imageLabel)")
        } label: {
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 48, height: 48)
                
                Text("\(imageLabel)")
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(.black)
            }
        }
        .frame(width: 102, height: 108)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(color: .black.opacity(0.1), radius: 3)
    }
}

#Preview {
    ShortcutButtonView(
        image: .starHistoryIcon,
        imageLabel: "별 히스토리"
    )
}
