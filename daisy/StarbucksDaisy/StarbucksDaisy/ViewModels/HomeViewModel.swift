//
//  HomeViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation
import SwiftUI

@Observable
class HomeViewModel {
    var recommendedMenus = [
        RecommendedMenu(name: "에스프레소 콘파냐", imagename: "coffee1"),
        RecommendedMenu(name: "에스프레소 마키아또", imagename: "coffee2"),
        RecommendedMenu(name: "아이스 카페 아메리카노", imagename: "coffee3"),
        RecommendedMenu(name: "카페 아메리카노", imagename: "coffee4"),
        RecommendedMenu(name: "아이스 카라멜 마키아또", imagename: "coffee5"),
        RecommendedMenu(name: "카라멜 마키아또", imagename: "coffee6")
    ]
}
