//
//  ReceiptModel.swift
//  VienStarbucks
//
//  Created by 이은정 on 4/10/25.
//
import Foundation

struct ReceiptModel: Identifiable {
    var id: UUID
    var place: String
    var date: String
    var amount: Int
}


