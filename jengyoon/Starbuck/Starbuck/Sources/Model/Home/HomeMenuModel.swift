//
//  HomeModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation

/// Home탭 사용자 추천 메뉴 모델
struct HomeMenuModel: Identifiable {
    let id: String = UUID().uuidString
    let coffee: String
    let imageName: String
}
