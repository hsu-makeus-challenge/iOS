//
//  OffsetKey.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 6/19/25.
//

import SwiftUI

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}
