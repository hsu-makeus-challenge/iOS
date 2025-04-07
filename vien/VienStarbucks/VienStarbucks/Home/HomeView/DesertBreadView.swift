import SwiftUI

struct DesertBreadView: View {
    var hVM = HomeViewModel()

    var body: some View {
        VStack(alignment: .leading) {
            
            HStack {
                Text("하루가 달콤해지는 디저트")
                    .font(.mainTextBold24)
                    .foregroundColor(.black)
                
            }

            Spacer().frame(height:25)
            
            ScrollView(.horizontal) {
                LazyHStack {
                    ForEach(hVM.desertBread) { bread in
                        CircleImageCard(imageName: bread.imageName, name: bread.name)
                    }
                }
                .padding(.trailing, 16)
            }
        }
        .padding(.leading, 20)
        
    }
}

#Preview {
    DesertBreadView()
}
