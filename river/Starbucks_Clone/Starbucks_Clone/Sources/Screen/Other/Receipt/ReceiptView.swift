//
//  ReceiptView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/10/25.
//

import SwiftUI
import PhotosUI

struct ReceiptView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    
    @State private var receiptViewModel: ReceiptViewModel = .init()
    
    var body: some View {
        VStack {
            ReceiptHeaderView()
            
            Spacer().frame(height: 24)
            
            ReceiptCardView()
//            ForEach(receiptViewModel.getImages(), id: \.self) { image in
//                Image(uiImage: image)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: 100, height: 100)
//                    .clipped()
//            }
//            
//            if let receipt = receiptViewModel.receiptModel {
//                VStack {
//                    VStack(alignment: .leading, spacing: 5) {
//                        Text("주문자: \(receipt.orderer)")
//                        Text("장소: \(receipt.store)")
//                        Text("마신 음료: \(receipt.menuItems.joined(separator: ", "))")
//                        Text("결제 금액: \(receipt.totalAmount)원")
//                        Text("주문번호: \(receipt.orderNumber)")
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading)
//                }
//            } else {
//                ProgressView("OCR 처리 중")
//            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    showActionSheet = true
                } label: {
                    Image(.Receipt.plus)
                        .resizable()
                        .frame(width: 15, height: 15)
                }
                
            }
        }
        .confirmationDialog(
            "사진을 어떻게 추가할까요?",
            isPresented: $showActionSheet,
            titleVisibility: .visible
        ) {
            Button("앨범에서 가져오기") {
                showPhotosPicker = true
            }
            
            Button("카메라로 촬영하기") {
                showCamera = true
            }
            
            Button("취소", role: .cancel) {}
        }
        .sheet(isPresented: $showCamera) {
            CameraPicker { image in
                receiptViewModel.addImage(image)
            }
        }
        .photosPicker(
            isPresented: $showPhotosPicker,
            selection: $selectedItems,
            maxSelectionCount: 1,
            matching: .images
        )
        .onChange(of: selectedItems) { oldItems, newItems in
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
                        receiptViewModel.addImage(image)
                    }
                }
            }
        }
        .task {
            receiptViewModel.performOCR()
        }
    }
}

fileprivate struct ReceiptHeaderView: View {
    fileprivate var body: some View {
        HStack {
            Text("총 ")
                .font(.mainTextSemiBold14)
            + Text("1건")
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color(.brown02))
            
            Spacer()
            
            Text("사용합계 ")
                .font(.mainTextSemiBold14)
            + Text("6500")
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color(.brown02))
        }
        .padding(.horizontal, 17)
    }
}

fileprivate struct ReceiptCardView: View {
    fileprivate var body: some View {
        List {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    Text("사당역")
                        .font(.mainTextSemiBold18)
                        .foregroundStyle(.black)
                    
                    Text("2025.01.05 11:30")
                        .font(.mainTextMedium16)
                        .foregroundStyle(Color(.gray03))
                    
                    Text("6300")
                        .font(.mainTextSemiBold18)
                        .foregroundStyle(Color(.brown02))
                }
                
                Spacer()
                
                Button {
                    print("receiptImg")
                } label: {
                    Image(.Receipt.receiptImg)
                        .resizable()
                        .frame(width: 16, height: 20)
                }

            }
        }
        .listStyle(.plain)
    }
}

struct Precipt_Preview: PreviewProvider {
    static var previews: some View {
        devicePreviews {
            ContentView()
                .environmentObject(AppEnvironment.previewEnv)
        }
    }
}

#Preview {
    ReceiptView()
}
