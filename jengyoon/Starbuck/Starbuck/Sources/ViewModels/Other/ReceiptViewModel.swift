//
//  ReceiptViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/11/25.
//

import Foundation
import UIKit
import Vision
import SwiftUI

// MARK: - 영수증 OCR 처리 ViewModel
class ReceiptViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var currentReceipt: ReceiptModel? // 현재 인식된 영수증 정보
    @Published var isProcessing: Bool = false    // OCR 처리 중 여부
    @Published var errorMessage: String?         // 에러 메시지

    // MARK: - Private Properties
    private let textRecognitionQueue = DispatchQueue(label: "com.starbuck.textrecognition", qos: .userInitiated)

    // MARK: - OCR 실행 메서드
    func performOCR(on image: UIImage) {
        guard let cgImage = image.cgImage else {
            self.errorMessage = "이미지 처리에 실패했습니다."
            return
        }

        isProcessing = true
        errorMessage = nil

        // OCR 요청 설정
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self else { return }

            if let error = error {
                DispatchQueue.main.async {
                    self.isProcessing = false
                    self.errorMessage = "텍스트 인식 실패: \(error.localizedDescription)"
                }
                return
            }

            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                DispatchQueue.main.async {
                    self.isProcessing = false
                    self.errorMessage = "인식된 텍스트 없음"
                }
                return
            }

            // 인식된 텍스트 추출
            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedStrings.joined(separator: "\n")
            print("🔍 OCR 전체 텍스트:\n\(fullText)")

            // 영수증 파싱 및 상태 업데이트
            DispatchQueue.main.async {
                self.parseStarbucksReceipt(from: fullText)
                self.isProcessing = false
            }
        }

        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR"]
        request.usesLanguageCorrection = true

        // 비동기 OCR 실행
        textRecognitionQueue.async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }

    // MARK: - 스타벅스 영수증 파싱 메서드
    private func parseStarbucksReceipt(from text: String) {
        let lines = text.components(separatedBy: .newlines)

        var store = "장소 없음"
        var totalAmount = 0
        var orderDate = ""
        var orderNumber = "주문번호 없음"

        var i = 0

        print("===== OCR 디버그 시작 =====")

        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔹 [\(i)] \(trimmed)")

            // 매장명: '점' 포함 시
            if store == "장소 없음", trimmed.contains("점") {
                store = "스타벅스 " + trimmed
            }

            // 결제 금액: '결제금액' 이후 두 줄 뒤 금액 추출
            if trimmed.contains("결제금액"), i + 2 < lines.count {
                let priceLine = lines[i + 2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    totalAmount = amount
                }
            }

            // 주문번호: 32로 시작하고 숫자 14자리 이상일 경우
            if trimmed.starts(with: "32"), trimmed.count >= 14, trimmed.allSatisfy({ $0.isNumber }) {
                orderNumber = trimmed
            }

            // 날짜: 정규표현식으로 날짜 형식 추출
            if let date = extractDate(from: trimmed) {
                orderDate = date
            }

            i += 1
        }

        // 날짜 없을 경우 현재 시간 사용
        if orderDate.isEmpty {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy.MM.dd HH:mm"
            orderDate = formatter.string(from: Date())
        }

        // 디버그 출력
        print("===== OCR 디버그 끝 =====")
        print("📍 매장명: \(store)")
        print("📅 날짜: \(orderDate)")
        print("💰 금액: \(totalAmount)")
        print("🧾 주문번호: \(orderNumber)")

        // 최종 파싱 결과 저장
        self.currentReceipt = ReceiptModel(
            store: store,
            orderDate: orderDate,
            totalAmount: totalAmount,
            orderNumber: orderNumber
        )
    }

    // MARK: - 날짜 추출
    private func extractDate(from text: String) -> String? {
        let datePattern = "\\d{4}[./-]\\d{2}[./-]\\d{2}"
        if let range = text.range(of: datePattern, options: .regularExpression) {
            return String(text[range])
        }
        return nil
    }
}
