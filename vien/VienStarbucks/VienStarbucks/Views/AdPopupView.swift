import SwiftUI

struct AdPopupView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Image("adImage")
                .resizable()
                .frame(height: 720)
                .ignoresSafeArea()
            
            Spacer().frame(height: 106)
            
            SeeAdMoreBtnView()
                .padding(.horizontal, 18)
            
            Spacer().frame(height: 19)
            
            dismissButton
        }
        
        Spacer().frame(height: 36)
    }
    
    //이 뷰 내에서만 사용되기에!! private으로 캡슐화!!
    private var dismissButton: some View {
        HStack {
            Spacer()
            
            Button {
                dismiss()
                print("dismiss")
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
    AdPopupView()
}
