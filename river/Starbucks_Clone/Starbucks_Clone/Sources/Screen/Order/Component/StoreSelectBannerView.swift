//
//  StoreSelectBannerView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import SwiftUI

struct StoreSelectBannerView: View {
    @EnvironmentObject private var env: AppEnvironment
    
    var body: some View {
        Button {
            env.router.sheetPresent(.storeSelectBanner)
        } label: {
            let _ = print(env.router.isShowingModal)
            VStack {
                Group {
                    HStack {
                        Text("주문할 매장을 선택해 주세요")
                            .foregroundColor(.white)
                            .font(.headline)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.white)
                    }
                    Divider()
                        .frame(height: 1)
                        .background(Color(.gray06))
                }
                .padding(.horizontal, 20)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 60)
            .background(Color(.black03))
        }

    }
}

#Preview {
    StoreSelectBannerView()
}
