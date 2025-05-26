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

#Preview {
    StoreInfoView(storeInfoViewModel: .init(locationManager: .shared))
}
