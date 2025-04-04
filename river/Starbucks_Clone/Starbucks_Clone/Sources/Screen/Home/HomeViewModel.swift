//
//  HomeViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

@Observable
class HomeViewModel {
    private var homeModel: HomeModel = .mockData
    private var router: NavigationRouter
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    var recommendedDrinks: [RecommendedDrink] {
        homeModel.remommendedDrinks
    }
    
    var newsCards: [NewsCard] {
        homeModel.newsCards
    }
    
    var desserts: [Dessert] {
        homeModel.dessert
    }
    
    func moveToMenuDetails(menuID: MenuID, temperatureType: TemperatureType) {
        router.push(.menuDeatile(menuID: menuID, temperatureType: temperatureType))
    }
}
