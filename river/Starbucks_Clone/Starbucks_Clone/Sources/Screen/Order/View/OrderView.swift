//
//  OrderView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/1/25.
//

import SwiftUI

struct OrderView: View {
    
    @State private var tabState = OrderTabState()
    
    var body: some View {
        VStack(alignment: .leading) {
            OrderHeaderView(tabState: tabState)
            
            OrderAllMenuView(tabState: tabState)
        }
    }
}

struct Order_Preview: PreviewProvider {
    static var previews: some View {
        devicePreviews {
            OrderView()
                .environmentObject(AppEnvironment.previewEnv)
        }
    }
}
