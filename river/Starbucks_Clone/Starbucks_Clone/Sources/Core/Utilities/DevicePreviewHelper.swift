//
//  DevicePreviewHelper.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/9/25.
//

import SwiftUI

enum PREVIEW_DEVICE_TYPE : String, CaseIterable {
    case iPhone_15_Pro = "iPhone 16 Pro"
    case iPhone_11 = "iPhone 11"
    
    var previewDevice: PreviewDevice {
            .init(rawValue: self.rawValue)
        }
}

/// 미리보기용 초기화까지 한 줄로 하는 함수
func devicePreviews<Content: View>(
    content: @escaping () -> Content
) -> some View {
    ForEach(PREVIEW_DEVICE_TYPE.allCases, id: \.self) { device in
        content()
            .previewDevice(device.previewDevice)
            .previewDisplayName(device.rawValue)
    }
}
