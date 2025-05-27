//
//  StoreDirectionView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import SwiftUI

// MARK: 매장 찾기&길찾기를 바인딩하는 뷰
struct StoreDirectionView: View {
    @EnvironmentObject private var env: AppEnvironment
    @Namespace private var underlineSegmentedBar
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @Binding private var tabState: StoreInfoTabState
    
    init(
        storeInfoViewModel: StoreInfoViewModel,
        tabState: Binding<StoreInfoTabState>
    ) {
        self.storeInfoViewModel = storeInfoViewModel
        self._tabState = tabState
    }
    
    var body: some View {
        Group {
            if tabState == .findStore {
                MapView(
                    mapViewModel: env.makeMapViewModel(storeProvider: storeInfoViewModel),
                    showAnnotations: false,
                    showRouteOverlay: true
                )
                
            } else if tabState == .directions {
                VStack {
                    StoreDirectionContentView(storeInfoViewModel: storeInfoViewModel)
                }
            }
        }
        .matchedGeometryEffect(
            id: "underline",
            in: underlineSegmentedBar
        )
    }
}
