//
//  MenuDetailViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

@Observable
class MenuDetailViewModel {
    let menu: MenuDetailModel
    var selectedType: TemperatureType
    
    init(menu: MenuDetailModel) {
        self.menu = menu
        self.selectedType = menu.variants.first?.type ?? .iced
    }
    
    var selectedVariant: MenuVariant? {
        menu.variants.first { $0.type == selectedType }
    }
    
    var availableTypes: [TemperatureType] {
        menu.variants.map { $0.type }
    }
}
