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
    @State private var images: [UIImage] = []
    
    @State private var showCamera = false
    @State private var showActionSheet = false
    @State private var showPhotosPicker = false
    
    private var viewModel: OCRViewModel = .init()
    
    
    //    @Bindable var viewModel: ImageViewModel = .init()
    
    //    let receipt: Receipt
    
    
    var body: some View {
        VStack {
            topNavigationItemBar
            
            Spacer().frame(height: 16)
            
            VStack {
                receiptTotalInfo
                
                Spacer()
                
                receiptList
                
                Spacer()
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.getImages(), id: \.self) { image in
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipped()
                        }
                    }
                }
                
                if !viewModel.recognizedText.isEmpty {
                    Divider()
                    Text("📝 OCR 결과")
                        .font(.headline)
                    ScrollView {
                        Text(viewModel.recognizedText)
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color(.secondarySystemBackground))
                    }
                    .frame(height: 200)
                } else {
                    Text("추출 결과 값 없음")
                }
            }
            .padding(.horizontal, 19)
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
                    images.append(image)
                }
            }
            .photosPicker(isPresented: $showPhotosPicker, selection: $selectedItems, maxSelectionCount: 1, matching: .images)
            .onChange(of: selectedItems) { oldItems,newItems in
                for item in newItems {
                    Task {
                        if let data = try? await item.loadTransferable(type: Data.self),
                           let image = UIImage(data: data) {
                            images.append(image)
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
            + Text("n건")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.brown01)
            
            Spacer()
            
            Text("사용합계 ")
                .font(.mainTextRegular18)
                .foregroundStyle(.black)
            + Text("6,500")
                .font(.mainTextSemiBold18)
                .foregroundStyle(.brown01)
        }
    }
    
    private var receiptList: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 9) {
                    //            Text("장소: \(receipt.store)")
                    Text("경복궁역")
                        .font(.mainTextSemiBold18)
                        .foregroundStyle(.black)
                    //            Text("주문시점: \(receipt.orderDate)")
                    Text("2025.04.08 11:30")
                        .font(.mainTextMedium16)
                        .foregroundStyle(.gray03)
                    //            Text("결제 금액: \(receipt.totalAmount)원")
                    Text("5700원")
                        .font(.mainTextSemiBold18)
                        .foregroundStyle(.brown02)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                Button(action: {
                    print("영수증 사진 보여주기")
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

#Preview {
    ReceiptView()
}
