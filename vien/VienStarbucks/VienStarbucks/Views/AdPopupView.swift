import SwiftUI

struct AdPopupView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack(spacing:20){
            Image("adImage")
                .resizable()
                .frame(width: 438, height:720)
            

            Button(action: {
                print("자세히 보기")
            }){
                Text("자세히 보기")
//                    .font(.mainTextMedium18)
                    .font(.mainTextMedium16)
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .foregroundColor(.white01)
                    .background(Color.green01)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            HStack{
                Spacer()
                Button(action: {
                    dismiss()  // 닫기 버튼에 dismiss 연결
                }) {
                    Text("X 닫기")
                        .foregroundColor(.gray)
                }
            }
        }
    }
}


#Preview {
    AdPopupView()
}
