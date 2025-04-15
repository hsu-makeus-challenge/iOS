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
    
    // MARK: - Properties
    @StateObject private var imagePickerViewModel = ImagePickerViewModel()
    @StateObject private var receiptViewModel = ReceiptViewModel()
    @EnvironmentObject private var router: NavigationRouter
    var body: some View {
        VStack(spacing: 0) {
            // MARK: - Navigation Bar
            CustomNavigationBar(
                title: "전자영수증",
                onBack: {
                    router.navigateBack()
                }, onPlus: {
                    imagePickerViewModel.showActionSheet = true
                })
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            Spacer()
            
            // MARK: - OCR 처리 O/X 뷰 구분
            if let receipt = receiptViewModel.currentReceipt {
                receiptContent(receipt)
            } else {
                Text("상단 + 버튼 클릭 후 영수증 이미지 첨부 해주세요")
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
                                CameraPicker { selectedImage in
                                    imagePickerViewModel.appendImage(selectedImage)
                                    receiptViewModel.performOCR(on: selectedImage)
                                }
                            }
                            .photosPicker(isPresented: $imagePickerViewModel.showPhotosPicker,
                                          selection: $imagePickerViewModel.selectedItems,
                                          maxSelectionCount: 1,
                                          matching: .images)
                            .onChange(of: imagePickerViewModel.images) { _, newImages in
                                if let lastImage = newImages.last {
                                    receiptViewModel.performOCR(on: lastImage)
                                }
                            }
    }
    
    // MARK: - Receipt Content View
    @ViewBuilder
    private func receiptContent(_ receipt: ReceiptModel) -> some View {
        VStack(spacing: 20) {
            // 총 건수와 사용 합계
            HStack {
                Text("총 1건")
                    .foregroundColor(.brown)
                Spacer()
                Text("사용합계")
                Text("\(receipt.totalAmount)원")
                    .foregroundColor(.brown)
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            
            // 영수증 상세 정보
            VStack(alignment: .leading, spacing: 15) {
                Text(receipt.store)
                    .font(.title3)
                    .fontWeight(.bold)
                HStack {
                    Text(receipt.orderDate)
                        .foregroundColor(.gray)
                    
                    Spacer()
                    
                    // 결제 상태 아이콘
                    Image(systemName: "dollarsign.circle.fill")
                        .foregroundColor(.green)
                        .font(.system(size: 30))
                }
                Text("\(receipt.totalAmount)원")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.brown)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

// MARK: - Preview
#Preview {
    ReceiptView()
}
