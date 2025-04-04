//
//  MenuDetailViewModel.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/3/25.
//

import Foundation

@Observable
class MenuDetailViewModel {
    /// 내부 저장용 private 변수
    /// `selectedTemperatureIndex`를 ViewModel에 둬야 하는 이유는 다음과 같다.(제 코드 보게 된다면 읽어보길 바랍니당)
    ///     - 단순히 UI의 시작적 상태가 아니라, "어떤 온도 타입을 선택했는가"라는 비지니스 로직과 직결된 상태값임. 따라서, ViewModel에서 관리하는게 이상적이다.
    ///     - 또한, 나중에 해당 메뉴의 옵션 설정 화면이 분리되거나, 다른 뷰에서도 어떤 온도를 선택했는지 알아야 한다면, 뷰모델에 있는 것이 확장 및 유지보수가 더 용이하다.
    ///     - 마지막으로, 단위 테스트가 쉬워지기 때문에 디버깅이 쉬워진다.
    var selectedTemperatureIndex: Int = 0
    let menu: MenuDetailModel
    
    init(menu: MenuDetailModel) {
        self.menu = menu
    }
    
    var selectedMenuItem: MenuTemperatureItem {
        menu.menuTemperatureItem[selectedTemperatureIndex]
    }
}
