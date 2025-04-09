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
    let onTapPlus: () -> Void

    /// 클로저로 View를 받아서 content로 초기화
    init(
        onTapPlus: @escaping () -> Void = {},
        @ViewBuilder content: () -> Content
    ) {
        self.onTapPlus = onTapPlus
        self.content = content()
    }

    /// SwiftUI에서 UIViewController를 생성하는 메서드
    func makeUIViewController(context: Context) -> UINavigationController {
        // SwiftUI 콘텐츠를 UIKit에서 쓸 수 있게 UIHostingController로 감싼다
        let hosting = UIHostingController(rootView: content)
        
        let nav = UINavigationController(rootViewController: hosting)
        
        // UINavigationBarAppearance를 사용해 네비게이션 바 스타일을 커스터마이징
        let appearance = UINavigationBarAppearance()
        // 생성한 appearance를 네비게이션 바에 적용
        appearance.backgroundColor = .white // 네비게이션 바 배경색
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black] // 타이틀 텍스트 색상
        nav.navigationBar.tintColor = .black
        
        return nav
    }

    /// SwiftUI에서 상태가 변경되었을 때 UIViewController를 업데이트하는 메서드
    func updateUIViewController(
        _ uiViewController: UINavigationController,
        context: Context
    ) {
        let hosting = UIHostingController(rootView: content)
        
        let plusImg = UIImage(resource: .Receipt.plus)
        
        let resizedImage = plusImg.preparingThumbnail(
            of: CGSize(width: 20, height: 20)
        )?.withRenderingMode(.alwaysOriginal)
        
        // FIXME: 이미지 위치 조절해야 됨
        // plus 버튼 설정
        hosting.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: resizedImage,
            style: .plain,
            target: context.coordinator,
            action: #selector(Coordinator.didTapPlus)
        )
        hosting.view.tintColor = .black

        // 루트에 추가
        uiViewController.setViewControllers([hosting], animated: false)
    }
    
    /// UIKit의 액션(Target-Action)을 처리하기 위한 Coordinator
    class Coordinator {
        @objc func didTapPlus() {
            print("➕ Plus button tapped")
            // 여기에 필요한 로직 추가 (예: 모달 열기, 상태 변경 등)
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
}
