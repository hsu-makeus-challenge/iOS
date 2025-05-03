//
//  StoreSelectSheetView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import SwiftUI

enum StoreSortType: String, CaseIterable {
    case distance
    case frequently
}

struct StoreSelectSheetView: View {
    
    @State private var searchText: String = ""
    @State private var storeSelectSheetViewModel: StoreSelectSheetViewModel = .init()
    @State private var storeSortType: StoreSortType = .distance
    
    var body: some View {
        VStack {
            StoreSelectHeaderView(
                searchText: $searchText,
                storeSortType: $storeSortType
            )
            
            StoreListView(
                storeSelectSheetViewModel: storeSelectSheetViewModel,
                storeSortType: $storeSortType
            )
        }
        .padding(.horizontal, 32.5)
    }
}

fileprivate struct StoreSelectHeaderView: View {
    @Binding private var searchText: String
    @Binding private var storeSortType: StoreSortType
    
    init(
        searchText: Binding<String>,
        storeSortType: Binding<StoreSortType>
    ) {
        self._searchText = searchText
        self._storeSortType = storeSortType
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
                    print("mapIcon")
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
                storeSortType = .distance
            } label: {
                Text("가까운 매장")
                    .foregroundStyle(
                        storeSortType == .distance
                        ? Color(.black03)
                        : Color(.gray02)
                    )
                    .font(.mainTextSemiBold14)
            }

            
            Divider().frame(width: 1, height: 12)
                .foregroundStyle(Color(.gray02))
            
            Button {
                storeSortType = .frequently
            } label: {
                Text("자주 가는 매장")
                    .foregroundStyle(
                        storeSortType == .frequently
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

fileprivate struct StoreListView: View {
    
    private var storeSelectSheetViewModel: StoreSelectSheetViewModel
    @Binding private var storeSortType: StoreSortType
    
    init(
        storeSelectSheetViewModel: StoreSelectSheetViewModel,
        storeSortType: Binding<StoreSortType>
    ) {
        self.storeSelectSheetViewModel = storeSelectSheetViewModel
        self._storeSortType = storeSortType
    }
    
    fileprivate var body: some View {
        let stores = storeSelectSheetViewModel.sotreSheetModel.storeList
        let sortedStoreList: [StoreList] = {
            switch storeSortType {
            case .distance:
                return stores.sorted(by: { $0.distance < $1.distance })
            case .frequently:
                // TODO: 추후 자주가는 매장 기준 정렬 필요
                return stores.sorted(by: { $0.title < $1.title })
            }
        }()
        List(sortedStoreList, id: \.id) { store in
            StoreSelectRowView(store: store)
                .listRowInsets(
                    EdgeInsets(top: 16, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .scrollIndicators(.never)
    }
}

fileprivate struct StoreSelectRowView: View {
    private var store: StoreList
    
    init(store: StoreList) {
        self.store = store
    }
    
    fileprivate var body: some View {
        HStack {
            Image(store.imageName)
                .resizable()
                .frame(width: 83, height: 83)
            
            Spacer().frame(width: 16)
            
            VStack(alignment: .leading) {
                Text(store.title)
                    .font(.mainTextSemiBold14)
                    .foregroundStyle(Color(.black03))
                
                Spacer().frame(height: 3)
                
                Text(store.address)
                    .font(.pretend(type: .semibold, size: 10))
                    .foregroundStyle(Color(.gray02))
                
                HStack {
                    if let storeType = store.storeType {
                        HStack {
                            ForEach(Array(storeType), id:\.self) { type in
                                Image("\(type.iconName)")
                                    .resizable()
                                    .frame(width: 18, height: 18)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    Text("\(store.distance)Km")
                        .font(.mainTextRegular12)
                        .foregroundStyle(Color(.black01))
                }
            }
        }
    }
}

#Preview {
    StoreSelectSheetView()
}
