//
//  NewsViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation
import SwiftUI

/// ObservableObject는 옵저빙 될 수 있는 모델을 의미
class NewsViewModel: ObservableObject {
    /// 피그마에 명시된 더미 데이터 주입
    /// @Published로 선언된 속성은 값이 변경 될 때 옵저빙 하고 있는 대상에게 알림을 준다.
    @Published var news: [NewsModel] = [
        NewsModel(imageName: "news1", title: "25년 3월 일회용컵 없는 날 캠페..", content: "매월 10일은 일회용컵 없는 날! 스타벅스 에모매장에서 개인컵 및 다회용 컵을 이용하세요."),
        NewsModel(imageName: "news2", title: "스타벅스 ooo점을 찾습니다", content: "스타벅스 커뮤니티 스토어 파트너를 웅영할 기관을 공모합니다."),
        NewsModel(imageName: "news3", title: "2월 8일, 리저브 스프링 신규 커...", content: "산뜻하고 달콤한 풍미가 가득한 리저브를 맛보세요.")
    ]
}
