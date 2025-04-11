//
//  ShopModel.swift
//  VienStarbucks
//
//  Created by 이은정 on 4/10/25.
//


// nil 값 처리 - Spacer() 할당해서 - ........
import Foundation
import SwiftUI


struct Product: Identifiable {
    let id = UUID()
    let name: String
    let image: String
    let ml: String
    
}

struct Banner: Identifiable {
    let id = UUID()
    let imageName: String
}
