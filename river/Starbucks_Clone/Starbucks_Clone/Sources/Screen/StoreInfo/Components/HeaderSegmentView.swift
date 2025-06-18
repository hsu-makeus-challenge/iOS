//
//  HeaderSegmentView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import SwiftUI

struct HeaderSegmentView: View {
    @Namespace private var underlineSegmentedBar
    @Binding private var tabState: StoreInfoTabState
    
    init(tabState: Binding<StoreInfoTabState>) {
        self._tabState = tabState
    }
    
    var body: some View {
        HStack {
            ForEach(StoreInfoTabState.allCases) { state in
                Button {
                    withAnimation {
                        tabState = state
                    }
                } label: {
                    VStack(spacing: 4) {
                        Text(state.title)
                            .font(.mainTextSemiBold24)
                            .foregroundStyle(.black)
                            .frame(minWidth: 220)
                            .frame(height: 43)
                        
                        if tabState == state {
                            Color.brown
                                .frame(width: 120, height: 3)
                                /// 두 개의 뷰 간 애니메이션 자연스럽게 연결하는 수정자
                                /// - id: 두 뷰가 같은 것처럼 연동하는 식별자
                                /// - namespace: 그룹화
                                .matchedGeometryEffect(
                                    id: "underline",
                                    in: underlineSegmentedBar
                                )
                        } else {
                            Color.clear.frame(height: 3)
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
        }
    }
}
