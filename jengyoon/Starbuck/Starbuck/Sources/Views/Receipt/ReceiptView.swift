import SwiftUI
import PhotosUI
import Vision

struct ReceiptView: View {
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Properties
    @StateObject private var imagePickerViewModel = ImagePickerViewModel()
    @StateObject private var receiptViewModel = ReceiptViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            CustomNavigationBar(title: "전자영수증", onBack: {
                dismiss()
            }, onPlus: {
                imagePickerViewModel.showActionSheet = true
            })
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            if let receipt = receiptViewModel.currentReceipt {
                // 영수증 정보 표시
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
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.blue.opacity(0.3), lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    
                    // 영수증 상세 정보
                    VStack(alignment: .leading, spacing: 15) {
                        Text(receipt.store)
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text(receipt.orderDate)
                            .foregroundColor(.gray)
                        
                        Text("\(receipt.totalAmount)원")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.brown)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 20)
                }
            } else {
                // 이미지 미리보기
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
            }
            
            Spacer()
        }
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
                if let image = image {
                    imagePickerViewModel.appendImage(image)
                    receiptViewModel.performOCR(on: image)
                }
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
}

#Preview {
    ReceiptView()
} 