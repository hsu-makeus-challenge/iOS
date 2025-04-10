import SwiftUI

struct AdvertisementView: View {
    @Binding var isPresented: Bool
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.4)
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                // 광고 이미지
                Image(.starbuck)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 400)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                
                // 닫기 버튼
                Button(action: {
                    isPresented = false
                }) {
                    Text("닫기")
                        .font(.PretendardMedium16)
                        .foregroundColor(.white)
                        .frame(width: 300, height: 50)
                        .background(Color.primaryGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .padding(.top, 16)
            }
        }
        .interactiveDismissDisabled() // 드래그로 닫기 비활성화
    }
}

#Preview {
    AdvertisementView(isPresented: .constant(true))
} 