import SwiftUI

struct TopNavBarView: View {
    var title: String
    var onBack: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                onBack()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
                    .padding()
            }
            Spacer()
            Text(title)
                .font(.mainTextMedium16)
                .foregroundColor(.black)
            Spacer()
            
            Spacer()
                .frame(width: 44)
        }
        .padding(.horizontal)
    }
}
