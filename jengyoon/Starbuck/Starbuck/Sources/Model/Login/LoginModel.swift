//
//  LoginModel.swift
//  Starbuck
//
//  Created by 송승윤 on 3/19/25.
//

import Foundation

struct LoginModel: Identifiable {
    let id: String = UUID().uuidString
    let pwd: String
}
