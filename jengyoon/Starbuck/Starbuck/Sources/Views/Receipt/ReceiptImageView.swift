import SwiftUI

struct ReceiptImageView: View {
    @Environment(\.dismiss) private var dismiss
    let receipt: ReceiptsModel
    
    var body: some View {
        ZStack {
            // 배경
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            // 영수증 이미지
            VStack {
                if let image = receipt.uiImage {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(12)
                        .padding()
                } else {
                    Text("영수증 이미지를 찾을 수 없습니다")
                        .foregroundColor(.white)
                }
                
                // 닫기 버튼
                Button(action: {
                    dismiss()
                }) {
                    Text("닫기")
                        .font(.system(size: 17, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 100, height: 40)
                        .background(Color.gray)
                        .cornerRadius(20)
                }
                .padding(.bottom, 30)
            }
        }
    }
} 