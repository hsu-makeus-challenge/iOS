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
    
    var recommendedDrinks: [RecommendedDrink] {
        homeModel.remommendedDrinks
    }
    
    var newsCards: [NewsCard] {
        homeModel.newsCards
    }
    
    var desserts: [Dessert] {
        homeModel.dessert
    }
}
