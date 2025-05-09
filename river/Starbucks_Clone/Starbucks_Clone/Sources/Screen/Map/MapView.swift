//
//  MapView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @Bindable private var locationManager: LocationManager
    @Bindable private var storeSelectSheetViewModel: StoreSelectSheetViewModel
    @State private var isUserInteracting: Bool = false
    
    init(
        storeSelectSheetViewModel: StoreSelectSheetViewModel,
        locationManager: LocationManager
    ) {
        self.storeSelectSheetViewModel = storeSelectSheetViewModel
        self.locationManager = locationManager
    }

    var body: some View {
        ZStack(alignment: .top) {
//            if isUserInteracting {
//                VStack {
//                    Spacer().frame(height: 22)
//                    // TODO: 재검색 기능 추후 추가하기
//                    Button {
//                        print("reload")
//                    } label: {
//                        Text("이 지역 검색")
//                            .font(.mainTextRegular13)
//                            .foregroundStyle(Color(.gray06))
//                    }
//                    .frame(width: 88, height: 36)
//                    .background(.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//                }
//            }
            
            MapViewRepresentable(
                locationManager: locationManager,
                storeSelectSheetViewModel: storeSelectSheetViewModel
            )
            .ignoresSafeArea()
        }
    }
}
