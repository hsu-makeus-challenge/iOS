//
//  ViewMetrics.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/2/25.
//

import SwiftUI

/// 앱 내 UI 구성에서 사용되는 뷰 관련 고정 치수(metric)들을 정의한 유틸리티 enum
enum ViewMetrics {
    static func tabBarHeight() -> CGFloat {
        let keyWindow = UIApplication.shared.connectedScenes
            .compactMap { ($0 as? UIWindowScene)?.keyWindow }
            .first

        let bottomInset = keyWindow?.safeAreaInsets.bottom ?? 0
        return 15 + bottomInset
    }
}
