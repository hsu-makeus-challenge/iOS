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
            ReceiptHeaderView(receiptViewModel: receiptViewModel)
            
            Spacer().frame(height: 24)
            
            ReceiptListView(receiptViewModel: receiptViewModel)
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
                        receiptViewModel.performOCR(
                            on: image,
                            at: receiptViewModel.lastImageIndex
                        )
                    }
                }
            }
        }
    }
}

fileprivate struct ReceiptHeaderView: View {
    @Bindable var receiptViewModel: ReceiptViewModel

    fileprivate var body: some View {
        HStack {
            Text("총 ")
                .font(.mainTextSemiBold14)
            + Text("\(receiptViewModel.receiptModel.count)건")
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color(.brown02))

            Spacer()

            Text("사용합계 ")
                .font(.mainTextSemiBold14)
            + Text("\(receiptViewModel.totalReceiptPrice)")
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color(.brown02))
        }
        .padding(.horizontal, 17)
    }
}

fileprivate struct ReceiptListView: View {
    @Bindable private var receiptViewModel: ReceiptViewModel

    init(receiptViewModel: ReceiptViewModel) {
        self.receiptViewModel = receiptViewModel
    }

    fileprivate var body: some View {
        List {
            ForEach(receiptViewModel.images.indices, id: \.self) { index in
                ReceiptCardView(receiptViewModel: receiptViewModel, index: index)
            }
        }
        .listStyle(.plain)
    }
}

fileprivate struct ReceiptCardView: View {
    @Bindable private var receiptViewModel: ReceiptViewModel
    private let index: Int

    init(receiptViewModel: ReceiptViewModel, index: Int) {
        self.receiptViewModel = receiptViewModel
        self.index = index
    }

    fileprivate var body: some View {
        HStack {
            if receiptViewModel.receiptModel.indices.contains(index) {
                let receipt = receiptViewModel.receiptModel[index]
                makeCardInfo(with: receipt)
            } else {
                ProgressView()
            }

            Spacer()

            Button {
                print("receiptImg \(index)")
            } label: {
                Image(.Receipt.receiptImg)
                    .resizable()
                    .frame(width: 16, height: 20)
            }
        }
    }

    private func makeCardInfo(with receipt: ReceiptModel) -> some View {
        VStack(alignment: .leading, spacing: 9) {
            Text(receipt.store)
                .font(.mainTextSemiBold18)
                .foregroundStyle(.black)

            Text(receipt.orderDate)
                .font(.mainTextMedium16)
                .foregroundStyle(Color(.gray03))

            Text("\(receipt.totalAmount)원")
                .font(.mainTextSemiBold18)
                .foregroundStyle(Color(.brown02))
        }
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
