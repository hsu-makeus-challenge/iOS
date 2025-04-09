//
//  ShortcutButtonView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import SwiftUI

/// 바로가기 버튼 뷰
struct ShortcutButtonView: View {
    
    @Bindable private var otherViewModel: OtherViewModel
    
    private var image: ImageResource
    private var imageLabel: String
    
    init(
        otherViewModel: OtherViewModel,
        image: ImageResource,
        imageLabel: String
    ) {
        self.otherViewModel = otherViewModel
        self.image = image
        self.imageLabel = imageLabel
    }
    
    var body: some View {
        Button {
            otherViewModel.navigateToReciept()
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
        otherViewModel: AppEnvironment.previewEnv.makeOtherViewModel(),
        image: .starHistoryIcon,
        imageLabel: "별 히스토리"
    )
}
