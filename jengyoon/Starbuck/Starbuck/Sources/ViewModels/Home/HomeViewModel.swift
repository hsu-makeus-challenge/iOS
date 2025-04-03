//
//  HomeViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    @AppStorage("nickname") private var nickname: String = ""
    
    /// 뷰에서 접근하는 닉네임
    var displayName: String {
        nickname.isEmpty ? "(설정 닉네임)" : nickname
    }
    
    /// 추천 메뉴 더미 데이터
    @Published var menus: [HomeMenuModel] = [
        HomeMenuModel(coffee: "에스프레소 콘파나", imageName: "coffee1"),
        HomeMenuModel(coffee: "에스프레소 마키아또", imageName: "coffee2"),
        HomeMenuModel(coffee: "아이스 카페 아메리카노", imageName: "coffee3"),
        HomeMenuModel(coffee: "카페 아메리카노", imageName: "coffee4"),
        HomeMenuModel(coffee: "아이스 카라멜 마키아또", imageName: "coffee5"),
        HomeMenuModel(coffee: "카라멜 마키아또", imageName: "coffee6")
    ]
}
