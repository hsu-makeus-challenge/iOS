//
//  ReceiptViewModel.swift
//  VienStarbucks
//
//  Created by 이은정 on 4/10/25.
////
import Foundation

class ReceiptViewModel: ObservableObject {
    @Published var receipts: [ReceiptModel] = [
        ReceiptModel(id: UUID(), place: "사당역", date: "2025.01.05 11:30", amount: 6500)
    ]
    
    var totalAmount: Int {
        receipts.reduce(0) { $0 + $1.amount }
    }
}

