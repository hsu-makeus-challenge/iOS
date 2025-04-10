////
////  ReceiptViewModel.swift
////  StarbucksDaisy
////
////  Created by 원주연 on 4/10/25.
////
//
//import Foundation
//import Vision
//
//@Observable
//class ReceiptViewModel {
//    
//    var currentReceipt: Receipt?
//    
//    func startOCR(_ segment: ReceiptSegment) {
//        guard let uiImage = UIImage(named: segment.imageName),
//              let cgImage = uiImage.cgImage else {
//            self.currentReceipt = nil
//            return
//        }
//        
//        let request = VNRecognizeTextRequest { [weak self] request, error in
//            guard let self = self,
//                  let observations = request.results as? [VNRecognizedTextObservation],
//                  error == nil else {
//                self?.currentReceipt = nil
//                return
//            }
//            
//            let recognizedStrings = observations.compactMap { $0.topCandidates(1).first?.string }
//            let fullText = recognizedStrings.joined(separator: "\n")
//            let parsed = self.parseWithoutRegex(from: fullText)
//            
//            DispatchQueue.main.async {
//                self.currentReceipt = parsed
//            }
//        }
//        
//        request.recognitionLevel = .accurate
//        request.recognitionLanguages = ["ko-KR"]
//        
//        DispatchQueue.global(qos: .userInitiated).async {
//            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
//            try? handler.perform([request])
//        }
//    }
//    
//}
