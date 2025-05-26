//
//  StoreInfoView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import SwiftUI

struct StoreInfoView: View {
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @State private var locationManager: LocationManager
    @State private var tabState: FindStoreTabState = .findStore
    
    init(
        storeInfoViewModel: StoreInfoViewModel,
        locationManager: LocationManager
    ) {
        self.storeInfoViewModel = storeInfoViewModel
        self.locationManager = locationManager
        self.storeInfoViewModel.loadStarbucksStores()
    }
    
    var body: some View {
        VStack {
            HeaderSegmentView(tabState: $tabState)
            
            Spacer().frame(height: 28)
            
            Divider()
            
            Spacer().frame(height: 32)
            
            StoreDirectionView(
                storeInfoViewModel: storeInfoViewModel,
                tabState: $tabState,
                locationManager: locationManager
            )
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

// MARK: 매장 찾기&길찾기를 바인딩하는 뷰
fileprivate struct StoreDirectionView: View {
    @Namespace private var underlineSegmentedBar
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @Binding private var tabState: FindStoreTabState
    @Bindable private var locationManager = LocationManager.shared
    
    init(
        storeInfoViewModel: StoreInfoViewModel,
        tabState: Binding<FindStoreTabState>,
        locationManager: LocationManager
    ) {
        self.storeInfoViewModel = storeInfoViewModel
        self._tabState = tabState
        self.locationManager = locationManager
    }
    
    fileprivate var body: some View {
        Group {
            // FIXME: 개발을 위한 조건문 주석
//            if tabState == .findStore {
//                MapView(
//                    viewModel: findStoreViewModel,
//                    locationManager: locationManager
//                )
//            } else if tabState == .directions {
//                FindLocationView()
//            }
            VStack {
                StoreDirectionContentView()
            }
        }
        .matchedGeometryEffect(
            id: "underline",
            in: underlineSegmentedBar
        )
    }
}

// MARK: 출발-도착지 입력 뷰
fileprivate struct StoreDirectionContentView: View {
    @State private var startLocationTextField: String = ""
    @State private var finishedLocationTextField: String = ""
    
    fileprivate var body: some View {
        VStack {
            startedLocationInput
            
            Spacer().frame(height: 13)
            
            finishedLocationInput
            
            Spacer().frame(height: 18)
            
            FindLocationBtnView()
            
            Spacer().frame(height: 28)
            
            FindStoreListView()
        }
        .padding(.horizontal, 31)
    }
    
    private var startedLocationInput: some View {
        HStack {
            Text("출발")
                .font(.mainTextSemiBold16)
                .foregroundStyle(Color(.black03))
            
            Spacer().frame(width: 15)
            
            Button {
                print("current location")
            } label: {
                Text("현재위치")
                    .font(.mainTextSemiBold16)
                    .foregroundStyle(Color(.white01))
                    .padding(.horizontal, 6)
            }
            .frame(height: 30)
            .background(Color(.brown01))
            .clipShape(RoundedRectangle(cornerRadius: 6))
            
            TextField("출발지 입력", text: $startLocationTextField)
                .frame(height: 30)
                .textFieldStyle(.roundedBorder)
            
            Spacer().frame(width: 8)
            
            Image(.searchIcon)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
    
    private var finishedLocationInput: some View {
        HStack {
            Text("도착")
                .font(.mainTextSemiBold16)
                .foregroundStyle(Color(.black03))
            
            Spacer().frame(width: 15)
            
            TextField("출발지 입력", text: $finishedLocationTextField)
                .frame(height: 30)
                .textFieldStyle(.roundedBorder)
            
            Spacer().frame(width: 8)
            
            Image(.searchIcon)
                .resizable()
                .frame(width: 20, height: 20)
        }
    }
}

fileprivate struct FindLocationBtnView: View {
    fileprivate var body: some View {
        Button {
            print("경로 찾기")
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

fileprivate struct FindStoreListView: View {
    fileprivate var body: some View {
        List {
            Color.blue
        }
        .listStyle(.plain)
    }
}

#Preview {
    StoreInfoView(
        storeInfoViewModel: .init(),
        locationManager: .shared
    )
}
