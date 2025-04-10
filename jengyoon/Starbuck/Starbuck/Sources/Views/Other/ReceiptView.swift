//
//  ReceiptView.swift
//  Starbuck
//
//  Created by 송승윤 on 4/10/25.
//

import SwiftUI
import PhotosUI

struct ReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Image Picker Properties
    @StateObject private var imagePickerViewModel = ImagePickerViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: "전자영수증", onBack: {
                dismiss()
            }, onPlus: {
                imagePickerViewModel.showActionSheet = true
            })
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            // 선택된 이미지 표시
            if !imagePickerViewModel.images.isEmpty {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10) {
                        ForEach(imagePickerViewModel.images, id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .padding(.vertical, 10)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        // MARK: - Image Picker Modifiers
        .confirmationDialog("사진을 어떻게 추가할까요?",
                          isPresented: $imagePickerViewModel.showActionSheet,
                          titleVisibility: .visible) {
            Button("앨범에서 가져오기") {
                imagePickerViewModel.showPhotosPicker = true
            }
            
            Button("카메라로 촬영하기") {
                imagePickerViewModel.showCamera = true
            }
            
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $imagePickerViewModel.showCamera) {
            CameraPicker { image in
                imagePickerViewModel.appendImage(image)
            }
        }
        .photosPicker(isPresented: $imagePickerViewModel.showPhotosPicker,
                     selection: $imagePickerViewModel.selectedItems,
                     maxSelectionCount: 5,
                     matching: .images)
    }
}

// MARK: - Preview
#Preview {
    ReceiptView()
}
