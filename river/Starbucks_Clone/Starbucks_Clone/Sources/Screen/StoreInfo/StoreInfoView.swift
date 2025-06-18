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
        self.storeInfoViewModel.loadStores()
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

//#Preview {
//    let env = AppEnvironment.previewEnv
//    StoreInfoView(storeInfoViewModel: .init(
//        locationManager: .shared,
//        mapViewModel: env.makeMapViewModel(storeProvider: env.makeStoreInfoViewModel())
//        )
//    )
//}
