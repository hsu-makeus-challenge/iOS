//
//  OtherViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 3/27/25.
//

import Foundation

@Observable
class OtherViewModel {
    private var router: NavigationRouter
    
    init(router: NavigationRouter) {
        self.router = router
    }
    
    func navigateToReciept() {
        router.push(.receipt)
    }
    
    func navigateToFindStore() {
        router.push(.findStore)
    }
}
