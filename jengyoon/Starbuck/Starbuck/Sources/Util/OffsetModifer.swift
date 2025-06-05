//
//  OffsetModifer.swift
//  Starbuck
//
//  Created by 송승윤 on 6/5/25.
//

import Foundation
import SwiftUI

/// 헤더 실시간 위치 추적
struct OffsetModifer: ViewModifier {
    @Binding var offset: CGFloat
    
    var returnromStart: Bool = true
    @State var startValue: CGFloat = 0
    
    func body(content: Content) -> some View {
        content
            .overlay(content: {
                GeometryReader(content: { proxy in
                    Color.red
                        .preference(key: OffsetKey.self, value: proxy.frame(in: .named("SCROLL")).minY)
                        .onPreferenceChange(OffsetKey.self) { value in
                            if startValue == 0 {
                                startValue = value
                            }
                            
                            offset = (value - (returnromStart ? startValue : 0))
                        }
                })
            })
    }
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
