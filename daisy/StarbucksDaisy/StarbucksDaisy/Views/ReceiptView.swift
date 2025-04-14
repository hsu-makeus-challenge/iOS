//
//  ReceiptView.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/10/25.
//

import SwiftUI
import PhotosUI

struct ReceiptView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedItems: [PhotosPickerItem] = []
    @State private var selectedImage: UIImage? = nil
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    @State private var showOverlay = false
    
    private var viewModel: ReceiptViewModel = .init()
    
    var body: some View {
        VStack {
            topNavigationItemBar
            
            ZStack {
                VStack {
                    Spacer().frame(height: 16)
                    
                    receiptTotalInfo
                    
                    Spacer().frame(height: 24)
                    
                    receiptListView(
                        receiptViewModel: viewModel,
                        onImageTap: { image in
                            selectedImage = image
                            showOverlay = true
                        })
                    
                    
                }
                .padding(.horizontal, 19)
                
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
        }
        .navigationBarBackButtonHidden(true)
        .background(.white01)
    }
    
    private var topNavigationItemBar: some View {
        HStack {
            Button(action: {
                print("뒤로")
                dismiss()
            }, label: {
                Image(systemName: "chevron.left")
                    .foregroundStyle(.black)
            })
            
            Spacer()
            
            Text("전자영수증")
                .font(.mainTextMedium16)
                .foregroundStyle(.black)
            
            Spacer()
            
            Button(action: {
                print("영수증 추가")
                showActionSheet = true
            }, label: {
                Image(systemName: "plus")
                    .foregroundStyle(.black)
            })
            .confirmationDialog("영수증을 어떻게 추가할까요?", isPresented: $showActionSheet, titleVisibility: .visible) {
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
                    viewModel.addImage(image)
                }
            }
            .photosPicker(
                isPresented: $showPhotosPicker,
                selection: $selectedItems,
                maxSelectionCount: 1,
                matching: .images
            )
            .onChange(of: selectedItems) { oldItems,newItems in
                for item in newItems {
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            viewModel.addImage(image)
                            viewModel.performOCR(
                                on: image,
                                at: viewModel.lastImageIndex
                            )
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 13.5)
        .frame(height: 56)
        .background(.white)
    }
    
    private var receiptTotalInfo: some View {
        HStack {
            Text("총 ")
                .font(.mainTextRegular18)
                .foregroundStyle(.black)
            + Text("\(viewModel.receiptModel.count)건")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.brown01)
            
            Spacer()
            
            Text("사용합계 ")
                .font(.mainTextRegular18)
                .foregroundStyle(.black)
            + Text("\(viewModel.totalReceiptPrice)")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.brown01)
        }
    }
    
    fileprivate struct receiptListView: View {
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
                        receiptCardView (
                            receiptViewModel: receiptViewModel,
                            index: index,
                            onImageTap: onImageTap
                        )
                    }
                }
            }
        }
    }
    
    fileprivate struct receiptCardView: View {
        @Bindable var receiptViewModel: ReceiptViewModel
        let index: Int
        let onImageTap: (UIImage) -> Void
        
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
            VStack {
                HStack {
                    if receiptViewModel.receiptModel.indices.contains(index) {
                        let receipt = receiptViewModel.receiptModel[index]
                        VStack(alignment: .leading, spacing: 9) {
                            
                            Text("\(receipt.store)")
                                .font(.mainTextSemiBold18)
                                .foregroundStyle(.black)
                            
                            Text("\(receipt.orderDate)")
                                .font(.mainTextMedium16)
                                .foregroundStyle(.gray03)
                            
                            Text("\(receipt.totalAmount)원")
                                .font(.mainTextSemiBold18)
                                .foregroundStyle(.brown02)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        let image = receiptViewModel.images[index]
                        onImageTap(image)
                    }, label: {
                        Image("receiptIcon")
                    })
                }
                
                Spacer().frame(height: 14)
                
                Divider()
                    .foregroundStyle(.gray01)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

//#Preview {
//    ReceiptView()
//}
