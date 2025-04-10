//
//  ReceiptViewModel.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//

import Foundation
import _PhotosUI_SwiftUI

// MARK: - ViewModel
class ImagePickerViewModel: ObservableObject {
    // 이미지 선택 관련 상태
    @Published var selectedItems: [PhotosPickerItem] = []
    @Published var images: [UIImage] = []
    
    // 시트 표시 상태
    @Published var showCamera = false
    @Published var showActionSheet = false
    @Published var showPhotosPicker = false
    
    init() {
        // selectedItems가 변경될 때마다 이미지 로드
        Task { @MainActor in
            for await items in $selectedItems.values {
                await loadImages(from: items)
            }
        }
    }
    
    func appendImage(_ image: UIImage) {
        images.append(image)
    }
    
    @MainActor
    private func loadImages(from items: [PhotosPickerItem]) async {
        for item in items {
            if let data = try? await item.loadTransferable(type: Data.self),
               let image = UIImage(data: data) {
                images.append(image)
            }
        }
    }
}
