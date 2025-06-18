//
//  StoreSelectSheetView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import SwiftUI

struct StoreSelectSheetView: View {
    @State private var searchText: String = ""
    @State private var showMap: Bool = false
    @Bindable private var storeSelectSheetViewModel: StoreSelectSheetViewModel
    @State private var locationManager = LocationManager.shared
    
    init(storeSelectSheetViewModel: StoreSelectSheetViewModel) {
        self.storeSelectSheetViewModel = storeSelectSheetViewModel
        self.storeSelectSheetViewModel.loadStores()
    }
    
    var body: some View {
        VStack {
            Spacer().frame(height: 24)
            
            StoreSelectHeaderView(
                searchText: $searchText,
                storeSelectSheetViewModel: storeSelectSheetViewModel,
                showMap: $showMap
            )
            .padding(.horizontal, 32.5)
            
            if showMap {
                MapView(
                    mapViewModel: storeSelectSheetViewModel.mapViewModel,
                    showAnnotations: true,
                    showRouteOverlay: false
                )
            } else {
                StoreListView(storeSelectSheetViewModel: storeSelectSheetViewModel)
                    .padding(.horizontal, 32.5)
            }
        }
    }
}

fileprivate struct StoreSelectHeaderView: View {
    @Binding private var searchText: String
    @Binding private var showMap: Bool
    @Bindable private var storeSelectSheetViewModel: StoreSelectSheetViewModel
    
    init(
        searchText: Binding<String>,
        storeSelectSheetViewModel: StoreSelectSheetViewModel,
        showMap: Binding<Bool>
    ) {
        self._searchText = searchText
        self.storeSelectSheetViewModel = storeSelectSheetViewModel
        self._showMap = showMap
    }
    
    fileprivate var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Text("매장 설정")
                    .font(.mainTextMedium16)
                    .foregroundStyle(Color(.black03))
                
                Spacer().frame(width: 142)
                
                Button {
                    showMap.toggle()
                } label: {
                    Image(.Order.Sheet.mapIcon)
                }
            }
            
            Spacer().frame(height: 24)
            
            searchBar
            
            Spacer().frame(height: 25)
            
            sortedStore
            
            Spacer().frame(height: 18)
            
            Divider()
                .background(Color(.gray07))
        }
    }
    
    private var searchBar: some View {
        TextField("검색", text: $searchText)
            .frame(height: 27)
            .padding(.horizontal, 7)
            .background(Color(.gray07)) // 회색 배경
            .cornerRadius(5)
    }
    
    private var sortedStore: some View {
        HStack {
            Button {
                storeSelectSheetViewModel.mapViewModel.storeSortType = .distance
            } label: {
                Text("가까운 매장")
                    .foregroundStyle(
                        storeSelectSheetViewModel.mapViewModel.storeSortType == .distance
                        ? Color(.black03)
                        : Color(.gray02)
                    )
                    .font(.mainTextSemiBold14)
            }

            
            Divider().frame(width: 1, height: 12)
                .foregroundStyle(Color(.gray02))
            
            Button {
                storeSelectSheetViewModel.mapViewModel.storeSortType = .frequently
            } label: {
                Text("자주 가는 매장")
                    .foregroundStyle(
                        storeSelectSheetViewModel.mapViewModel.storeSortType == .frequently
                        ? Color(.black03)
                        : Color(.gray02)
                    )
                    .font(.mainTextSemiBold14)
                    .kerning(-1)
            }

            
            Spacer()
        }
    }
}

struct StoreSelectSheetViewModel_Previews: PreviewProvider {
    static var previews: some View {
        let env = AppEnvironment.previewEnv
        devicePreviews {
            StoreSelectSheetView(
                storeSelectSheetViewModel: .init(
                    router: env.router,
                    mapViewModel: env.makeMapViewModel()
                )
            )
        }
    }
}
