import SwiftUI

struct AdPopupView: View {
    @Binding var isShowing: Bool

    var body: some View {
            VStack{
                Image("adImage")
                    .resizable()
                    .ignoresSafeArea()
                    .frame(height:600)

                Spacer().frame(height: 106)

                SeeAdMoreBtnView()
                    .padding(.horizontal, 18)

                Spacer().frame(height: 20)

                dismissButton

                Spacer().frame(height: 36)
            }
            .background(Color.white)
            
        
    }

    private var dismissButton: some View {
        HStack {
            Spacer()
            Button {
                isShowing = false
            } label: {
                Text("X 닫기")
                    .font(.mainTextLight14)
                    .foregroundStyle(Color(.gray05))
            }
            Spacer().frame(width: 36)
        }
    }
}




struct SeeAdMoreBtnView: View {
    
    var body: some View {
        Button {
            print("자세히 보기")
        } label: {
            Text("자세히 보기")
                .font(.mainTextMedium16)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 58)
        }
        .background(Color(.green01))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    AdPopupView(isShowing: .constant(true))
}

