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
    
    let start = CLLocationCoordinate2D(latitude: 37.499588, longitude: 126.867394)
    let end = CLLocationCoordinate2D(latitude: 37.501546, longitude: 126.882223)
    
    init(mapViewModel: MapViewModel) {
        self.mapViewModel = mapViewModel
        self.mapViewModel.updateRegionFromCurrentLocation()
    }

    var body: some View {
        ZStack(alignment: .top) {
            if let region = mapViewModel.region {
                MapViewControllerWrapper(
                    region: region,
                    mapViewModel: mapViewModel,
                    isUserInteracting: $isUserInteracting,
                    isSystemAnimationFlag: $isSystemAnimationFlag,
                    coordinates: mapViewModel.polylineCoordinates
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
        .onAppear {
            Task {
                await mapViewModel.fetchRouteWithOSRM(from: start, to: end)
            }
        }
    }
}
