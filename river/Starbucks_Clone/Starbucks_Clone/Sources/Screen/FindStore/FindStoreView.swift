//
//  FindStoreView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import SwiftUI

struct FindStoreView: View {
    @State private var locationManager = LocationManager.shared
    @State private var tabState: FindStoreTabState = .findStore
    
    var body: some View {
        VStack {
            HeaderSegmentView(tabState: $tabState)
            
            FindStoreMapView(tabState: $tabState, locationManager: locationManager)
        }
    }
}

fileprivate struct HeaderSegmentView: View {
    @Namespace private var underlineSegmentedBar
    @Binding private var tabState: FindStoreTabState
    
    init(tabState: Binding<FindStoreTabState>) {
        self._tabState = tabState
    }
    
    fileprivate var body: some View {
        HStack {
            ForEach(FindStoreTabState.allCases) { state in
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

fileprivate struct FindStoreMapView: View {
    @Binding private var tabState: FindStoreTabState
    @Bindable private var locationManager = LocationManager.shared
    
    init(
        tabState: Binding<FindStoreTabState>,
        locationManager: LocationManager
    ) {
        self._tabState = tabState
        self.locationManager = locationManager
    }
    
    fileprivate var body: some View {
        TabView(selection: $tabState) {
            Text("Map")
            .tag(FindStoreTabState.findStore)
            Text("Good")
                .tag(FindStoreTabState.directions)
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(
            .easeInOut(duration: 0.5),
            value: tabState
        )
    }
}

#Preview {
    FindStoreView()
}
