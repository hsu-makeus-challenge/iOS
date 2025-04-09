//
//  CustomNavigationView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/10/25.
//

import UIKit
import SwiftUI

//
//  CustomNavigationView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/10/25.
//

import UIKit
import SwiftUI

/// SwiftUI 화면을 UIKit의 UINavigationController로 감싸서
/// 특정 화면에서만 커스텀한 네비게이션 바 스타일을 적용할 수 있게 해주는 래퍼 뷰
/// `GlobalNavigationBarStyle.swift`에서 전역 설정한 네비게이션 설정과 충돌하지 않는 구조
struct CustomNavigationView<Content: View>: UIViewControllerRepresentable {
    /// SwiftUI로 구성된 내부 콘텐츠
    let content: Content
    
    /// 클로저로 View를 받아서 content로 초기화
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    /// SwiftUI에서 UIViewController를 생성하는 메서드
    func makeUIViewController(context: Context) -> UINavigationController {
        // SwiftUI 콘텐츠를 UIKit에서 쓸 수 있게 UIHostingController로 감싼다
        let hosting = UIHostingController(rootView: content)
        
        let nav = UINavigationController(rootViewController: hosting)
        
        // UINavigationBarAppearance를 사용해 네비게이션 바 스타일을 커스터마이징
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .white // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black] // 타이틀 텍스트 색상
        
        // 생성한 appearance를 네비게이션 바에 적용
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = appearance
        
        return nav
    }

    /// SwiftUI에서 상태가 변경되었을 때 UIViewController를 업데이트하는 메서드
    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {
        // 루트 뷰 컨트롤러를 다시 설정하여 최신 content를 반영
        uiViewController.setViewControllers(
            [UIHostingController(rootView: content)],
            animated: false
        )
    }
}
