//
//  StoreListView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import SwiftUI

struct StoreListView: View {
    
    private var storeSelectSheetViewModel: StoreSelectSheetViewModel
    
    init(
        storeSelectSheetViewModel: StoreSelectSheetViewModel
    ) {
        self.storeSelectSheetViewModel = storeSelectSheetViewModel
    }
    
    var body: some View {
        List(
            storeSelectSheetViewModel.sortedStoreList,
            id: \.id
        ) { store in
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
                    
                    // 소수점 2번째 자리까지 표현
                    Text("\(String(format: "%.2f", store.distance))Km")
                        .font(.mainTextRegular12)
                        .foregroundStyle(Color(.black01))
                }
            }
        }
    }
}

#Preview {
    StoreListView(storeSelectSheetViewModel: .init(router: AppEnvironment.previewEnv.router))
}
