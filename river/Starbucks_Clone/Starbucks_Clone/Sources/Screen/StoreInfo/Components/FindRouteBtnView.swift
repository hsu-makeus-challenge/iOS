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
    @Binding private var storeSearchState: StoreSearchState
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    
    init(
        storeSearchState: Binding<StoreSearchState>,
        storeInfoViewModel: StoreInfoViewModel
    ) {
        self._storeSearchState = storeSearchState
        self.storeInfoViewModel = storeInfoViewModel
    }
    
    var body: some View {
        Button {
            Task {
                await storeInfoViewModel.findRouteBtnTapped(
                    from: storeSearchState.startAddress,
                    to: storeSearchState.finishAddress
                )
            }
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

