//
//  NewProduct.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/10/25.
//

import Foundation

struct NewProduct: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let volume: String
}
