//
//  DesertViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/3/25.
//

import Foundation

class DesertViewModel: ObservableObject {
    /// @Published로 옵저빙된 대상 바뀌었을시 알림준다.
    @Published var deserts: [DesertsModel] = [
        DesertsModel(title: "너티 크루아상", imageName: "desert1"),
        DesertsModel(title: "매콤 소시지 불고기", imageName: "desert2"),
        DesertsModel(title: "미니 리프 파이", imageName: "desert3"),
        DesertsModel(title: "빵 오 쇼콜라", imageName: "desert4"),
        DesertsModel(title: "소시지& 올리브 파이", imageName: "desert5")
    ]
}
