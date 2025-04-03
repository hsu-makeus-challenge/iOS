//
//  NewsModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation

/// Home 뉴스 모델
struct NewsModel: Identifiable {
    let id: String = UUID().uuidString
    let imageName: String
    let title: String
    let content: String
}
