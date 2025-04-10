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
    
    var body: some View {
        VStack {
            Text("Hello")
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
        .photosPicker(
            isPresented: $showPhotosPicker,
            selection: $selectedItems,
            maxSelectionCount: 5,
            matching: .images
        )
        .onChange(of: selectedItems) { oldItems, newItems in
            for item in newItems {
                Task {
                    if let data = try? await item.loadTransferable(type: Data.self),
                       let image = UIImage(data: data) {
//                        viewModel.addImage(image)
                        print("addImage")
                    }
                }
            }
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
