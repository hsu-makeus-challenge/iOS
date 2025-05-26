//
//  FindStoreListView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import SwiftUI

struct FindStoreListView: View {
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @Binding private var storeSearchState: StoreSearchState
    
    init(
        storeInfoViewModel: StoreInfoViewModel,
        storeSearchState: Binding<StoreSearchState>
    ) {
        self.storeInfoViewModel = storeInfoViewModel
        self._storeSearchState = storeSearchState
    }
    
    var body: some View {
        List(storeInfoViewModel.searchPlaceList, id: \.id) { place in
            Button {
                switch storeSearchState.searchType {
                case .startedLocation:
                    storeSearchState.startAddress = place.name
                case .finishedLocation:
                    storeSearchState.finishAddress = place.name
                }
            } label: {
                searchPlaceResultView(place)
            }

        }
        .listStyle(.plain)
    }
    
    private func searchPlaceResultView(_ place: StoreInfoModel) -> some View {
        return VStack(alignment: .leading, spacing: 8) {
            Text("\(place.name)")
                .font(.mainTextMedium16)
                .foregroundStyle(Color(.black01))
            
            Text("\(place.address)")
                .font(.mainTextSemiBold14)
                .foregroundStyle(Color(.gray04))
        }
    }
}
