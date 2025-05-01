//
//  OrderViewModel.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 5/1/25.
//

import SwiftUI

@Observable
class OrderViewModel {
    var selectedSegment: OrderSegment = .first
    var selectedMenuSegment: MenuSegment = .first
}
