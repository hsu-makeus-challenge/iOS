//
//  StoreDirectionContentView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import SwiftUI

// MARK: 출발-도착지 입력 뷰
struct StoreDirectionContentView: View {
    @EnvironmentObject private var env: AppEnvironment
    @Bindable private var storeInfoViewModel: StoreInfoViewModel
    @State private var storeSearchState = StoreSearchState()
    
    init(
        storeInfoViewModel: StoreInfoViewModel
    ) {
        self.storeInfoViewModel = storeInfoViewModel
    }
    
    var body: some View {
        VStack {
            Group {
                startedLocationInput
                
                Spacer().frame(height: 13)
                
                finishedLocationInput
                
                Spacer().frame(height: 18)
                
                FindLocationBtnView()
                
                Spacer().frame(height: 28)
            }
            .padding(.horizontal, 31)
            
            FindStoreListView(
                storeInfoViewModel: storeInfoViewModel,
                storeSearchState: $storeSearchState
            )
        }
    }
    
    private var startedLocationInput: some View {
        locationInputField(
            label: "출발",
            text: $storeSearchState.startAddress,
            includeCurrentLocationButton: true,
            onCurrentLocationTap: {
                Task {
                    if let currentAddress = await storeInfoViewModel.getCurrentLocationAddress() {
                        storeSearchState.startAddress = currentAddress
                    }
                }
            },
            onSearchTap: {
                if storeSearchState.startAddress.isEmpty {
                    print("출발 장소를 입력해 주세요")
                    return
                }
                Task {
                    await storeInfoViewModel.addressSearchWithKakao(
                        storeSearchState.startAddress
                    )
                }
                storeSearchState.searchType = .startedLocation
            }
        )
    }
    
    private var finishedLocationInput: some View {
        locationInputField(
            label: "도착",
            text: $storeSearchState.finishAddress,
            onSearchTap: {
                if storeSearchState.finishAddress.isEmpty {
                    print("도착 장소를 입력해 주세요")
                    return
                }
                storeInfoViewModel.searchStarbucksStore(storeSearchState.finishAddress)
                storeSearchState.searchType = .finishedLocation
            }
        )
    }
    
    @ViewBuilder
    private func locationInputField(
        label: String,
        text: Binding<String>,
        includeCurrentLocationButton: Bool = false,
        onCurrentLocationTap: (() -> Void)? = nil,
        onSearchTap: @escaping () -> Void
    ) -> some View {
        HStack {
            Text(label)
                .font(.mainTextSemiBold16)
                .foregroundStyle(Color(.black03))

            Spacer().frame(width: 15)

            if includeCurrentLocationButton, let onCurrentLocationTap {
                Button(action: onCurrentLocationTap) {
                    Text("현재위치")
                        .font(.mainTextSemiBold16)
                        .foregroundStyle(Color(.white01))
                        .padding(.horizontal, 6)
                }
                .frame(height: 30)
                .background(Color(.brown01))
                .clipShape(RoundedRectangle(cornerRadius: 6))
            }

            TextField("\(label)지 입력", text: text)
                .frame(height: 30)
                .textFieldStyle(.roundedBorder)

            Spacer().frame(width: 8)

            Button(action: onSearchTap) {
                Image(.searchIcon)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
        }
    }
}
