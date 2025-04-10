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
    
    @State private var selectedImage: UIImage? = nil
    @State private var showOverlay = false
    
    @State private var receiptViewModel: ReceiptViewModel = .init()
    
    var body: some View {
        ZStack {
            VStack {
                ReceiptHeaderView(receiptViewModel: receiptViewModel)
                Spacer().frame(height: 24)
                ReceiptListView(
                    receiptViewModel: receiptViewModel,
                    onImageTap: { image in
                        selectedImage = image
                        showOverlay = true
                    }
                )
            }
            
            if showOverlay, let image = selectedImage {
                Color.black.opacity(0.6)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showOverlay = false
                    }
                
                withAnimation {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .padding(30)
                        .onTapGesture {
                            showOverlay = false
                        }
                }
            }
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
    let onImageTap: (UIImage) -> Void

    init(
        receiptViewModel: ReceiptViewModel,
        onImageTap: @escaping (UIImage) -> Void
    ) {
        self.receiptViewModel = receiptViewModel
        self.onImageTap = onImageTap
    }

    fileprivate var body: some View {
        ScrollView {
            VStack(spacing: 8) {
                ForEach(receiptViewModel.images.indices, id: \.self) { index in
                    ReceiptCardView(
                        receiptViewModel: receiptViewModel,
                        index: index,
                        onImageTap: onImageTap
                    )
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

fileprivate struct ReceiptCardView: View {
    @Bindable private var receiptViewModel: ReceiptViewModel
    private let index: Int
    private let onImageTap: (UIImage) -> Void

    init(
        receiptViewModel: ReceiptViewModel,
        index: Int,
        onImageTap: @escaping (UIImage) -> Void
    ) {
        self.receiptViewModel = receiptViewModel
        self.index = index
        self.onImageTap = onImageTap
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
                let image = receiptViewModel.images[index]
                onImageTap(image)
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
