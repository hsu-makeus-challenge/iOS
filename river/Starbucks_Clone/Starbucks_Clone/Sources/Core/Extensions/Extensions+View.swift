//
//  Extensions+View.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 6/19/25.
//

import SwiftUI

extension View {
    func getScreenSize() -> CGSize {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds.size
    }
}
