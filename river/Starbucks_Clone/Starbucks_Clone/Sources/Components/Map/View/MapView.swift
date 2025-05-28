//
//  MapView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Bindable private var mapViewModel: MapViewModel
    @State private var isUserInteracting: Bool = false
    @State private var isSystemAnimationFlag: Bool = true
    private let showAnnotations: Bool
    private let showRouteOverlay: Bool
    
    init(
        mapViewModel: MapViewModel,
        showAnnotations: Bool,
        showRouteOverlay: Bool
    ) {
        self.mapViewModel = mapViewModel
        self.showAnnotations = showAnnotations
        self.showRouteOverlay = showRouteOverlay
        self.mapViewModel.updateRegionFromCurrentLocation()
    }

    var body: some View {
        ZStack(alignment: .top) {
            if let region = mapViewModel.region {
                MapViewControllerWrapper(
                    mapViewModel: mapViewModel,
                    isUserInteracting: $isUserInteracting,
                    isSystemAnimationFlag: $isSystemAnimationFlag,
                    region: region,
                    showAnnotations: showAnnotations,
                    showRouteOverlay: showRouteOverlay
                )
                .ignoresSafeArea()
            } else {
                ProgressView("Loading View...")
            }
            
            if isUserInteracting {
                VStack {
                    Spacer().frame(height: 22)
                    // TODO: 재검색 기능 추후 추가하기
                    Button {
                        print("reload")
                        isUserInteracting = false
                        /// 지역 검색 후 유저 인터랙팅 전까지 시스템 애니메이션 영역이므로 true
                        isSystemAnimationFlag = true
                    } label: {
                        Text("이 지역 검색")
                            .font(.mainTextRegular13)
                            .foregroundStyle(Color(.gray06))
                    }
                    .frame(width: 88, height: 36)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                }
            }
        }
    }
}
