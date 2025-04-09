//
//  ReceiptsViewModel.swift
//  Weak4
//
//  Created by jaewon Lee on 4/9/25.
//

import SwiftUI
import Vision

@Observable
class ReceiptsViewModel {
    var selectedSegment: ReceiptSegment = .first {
        didSet {
            starOCR(selectedSegment)
        }
    }
    
    var currentReceipt: ReceiptsModel?
    
    func starOCR(_ segment: ReceiptSegment) {
        guard let uiImage = UIImage(named: segment.imageName),
              let cgImage = uiImage.cgImage else {
            self.currentReceipt = nil
            return
        }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                self?.currentReceipt = nil
                return
            }
            
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            let parsed = self.parseWithoutRegex(from: fullText)
            
            DispatchQueue.main.async {
                self.currentReceipt = parsed
            }
        }
        
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR"]
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }
    
    private func parseWithoutRegex(from text: String) -> ReceiptsModel {
        let lines = text.components(separatedBy: .newlines)
        
        var orderer = "주문자 없음"
        var store = "장소 없음"
        var menuItems: [String] = []
        var totalAmount = 0
        var orderNumber = "주문번호 없음"
        
        var isMenuSection = false
        var i = 0
        
        print("====== OCR 디버그 시작 ======")
        
        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("[\(i)] \(trimmed)")
            i += 1
        }
        
        return ReceiptsModel(
            orderer: orderer,
            store: store,
            menuItems: menuItems,
            totalAmount: totalAmount,
            orderNumber: orderNumber
        )
    }
}
