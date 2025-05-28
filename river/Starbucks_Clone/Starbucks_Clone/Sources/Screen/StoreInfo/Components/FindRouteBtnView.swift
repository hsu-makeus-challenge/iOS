//
//  FindRouteBtnView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import SwiftUI
import CoreLocation

struct RouteCoordinate {
    let from: CLLocationCoordinate2D
    let to: CLLocationCoordinate2D
}

// TODO: 버튼 누르면 경로 찾는 기능 구현하기
struct FindLocationBtnView: View {
//    private let mapViewModel: MapViewModel
//    
//    init(mapViewModel: MapViewModel) {
//        self.mapViewModel = mapViewModel
//    }
    
    var body: some View {
        Button {
            //
        } label: {
            Text("경로 찾기")
                .font(.mainTextMedium16)
                .foregroundStyle(Color.white)
        }
        .frame(width: 375, height: 38)
        .background(Color(.green00))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

