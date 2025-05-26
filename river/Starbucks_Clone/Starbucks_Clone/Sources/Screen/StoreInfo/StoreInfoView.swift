//
//  StoreInfoView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import SwiftUI

struct StoreInfoView: View {
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @State private var tabState: StoreInfoTabState = .findStore
    
    init(
        storeInfoViewModel: StoreInfoViewModel
    ) {
        self.storeInfoViewModel = storeInfoViewModel
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
                tabState: $tabState
            )
        }
    }
}

fileprivate struct HeaderSegmentView: View {
    @Namespace private var underlineSegmentedBar
    @Binding private var tabState: StoreInfoTabState
    
    init(tabState: Binding<StoreInfoTabState>) {
        self._tabState = tabState
    }
    
    fileprivate var body: some View {
        HStack {
            ForEach(StoreInfoTabState.allCases) { state in
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
    @Binding private var tabState: StoreInfoTabState
    
    init(
        storeInfoViewModel: StoreInfoViewModel,
        tabState: Binding<StoreInfoTabState>
    ) {
        self.storeInfoViewModel = storeInfoViewModel
        self._tabState = tabState
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
                StoreDirectionContentView(storeInfoViewModel: storeInfoViewModel)
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
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @State private var startLocationTextField: String = ""
    @State private var finishedLocationTextField: String = ""
    
    init(
        storeInfoViewModel: StoreInfoViewModel
    ) {
        self.storeInfoViewModel = storeInfoViewModel
    }
    
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
                Task {
                    await storeInfoViewModel.getCurrentLocationAddress()
                }
                if let currentAddress = storeInfoViewModel.currentAddress {
                    startLocationTextField = currentAddress
                }
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
            
            Button {
                if startLocationTextField != "" {
                    Task {
                        await storeInfoViewModel.addressSearchWithKakao(startLocationTextField)
                    }
                } else {
                    print("출발 장소를 입력해 주세요")
                }
            } label: {
                Image(.searchIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
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
    StoreInfoView(storeInfoViewModel: .init(locationManager: .shared))
}
